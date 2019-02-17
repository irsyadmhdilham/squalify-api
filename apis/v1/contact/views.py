from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from .. ._models.profile import Profile
from .. ._models.point import Point, PointLogType, PointLog, PointField, PointAttribute
from .. ._models.contact import Contact, ContactType, ContactStatus
from .. ._models.schedule import Schedule
from .serializers import ContactSerializer, CallLogSerializer
from django.db.models import Q
import requests
import json
from dateutil import parser
import re
from django.utils import timezone

class ContactList(generics.ListCreateAPIView):
    serializer_class = ContactSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).contacts.all().order_by('-created_on')

    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        referrer_pk = self.request.data.get('referrerId')
        contact_type_val = self.request.data.get('contact_type')
        profile = Profile.objects.get(pk=user_pk)
        contact_type = ContactType.objects.get(name=contact_type_val)
        new_contact = serializer.save(contact_type=contact_type)
        if referrer_pk is not None:
            referrer = Contact.objects.get(pk=referrer_pk)
            new_contact = serializer.save(contact_type=contact_type, referrer=referrer)
        profile.contacts.add(new_contact)

class ContactDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def perform_update(self, serializer):
        pk = self.kwargs.get('pk')
        contact_type_val = self.request.data.get('contact_type')
        status_val = self.request.data.get('status')
        q = self.request.query_params.get('xtra')

        contact = Contact.objects.get(pk=pk)
        contact_type = ContactType.objects.get(name=contact_type_val)
        status = ContactStatus.objects.get(name=status_val)
        instance = serializer.save(contact_type=contact_type, status=status)
        if q == 'add-schedule':
            schedule_pk = self.request.data.get('scheduleId')
            schedule = Schedule.objects.get(pk=schedule_pk)
            contact.schedules.add(schedule)
            schedule.contact = contact
            schedule.save()


    def perform_destroy(self, instance):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        profile.contacts.remove(instance)
        instance.delete()

class ContactFilter(generics.ListAPIView):
    serializer_class = ContactSerializer
    authentication_classes = (SessionAuthentication, TokenAuthentication,)

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        contact_type = self.request.query_params.get('ct')
        contact_status = self.request.query_params.get('cs')
        name = self.request.query_params.get('n')
        
        contacts = Profile.objects.get(pk=pk).contacts
        result = contacts.all()
        if contact_type != 'undefined' and contact_status != 'undefined' and name != 'undefined':
            result = contacts.filter(
                Q(contact_type__name=contact_type) &
                Q(status__name=contact_status) &
                Q(name__icontains=f'{name}')
            )
        elif contact_type != 'undefined' and contact_status != 'undefined':
            result = contacts.filter(
                Q(contact_type__name=contact_type) &
                Q(status__name=contact_status)
            )
        elif contact_type != 'undefined' and name != 'undefined':
            result = contacts.filter(
                Q(contact_type__name=contact_type) &
                Q(name__icontains=f'{name}')
            )
        elif contact_status != 'undefined' and name != 'undefined':
            result = contacts.filter(
                Q(status__name=contact_status) &
                Q(name__icontains=f'{name}')
            )
        elif contact_type != 'undefined':
            result = contacts.filter(contact_type__name=contact_type)
        elif contact_status != 'undefined':
            results = contacts.filter(status__name=contact_status)
        elif name != 'undefined':
            result = contacts.filter(name__icontains=f'{name}')
            
        return result

class CallLogs(generics.ListCreateAPIView):
    serializer_class = CallLogSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        call_logs = Profile.objects.get(pk=user_pk).call_logs
        if 'logs' in call_logs:
            logs = call_logs['logs']
            def serialize(value):
                i = value[0]
                val = value[1]
                return { 'pk': i, **val }
            return map(serialize, enumerate(logs))
        return []
    
    def perform_create(self, serializer):
        data = self.request.data
        serializer.save(**data)

class CallLogsUpdate(APIView):
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def put(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
        answered = request.data.get('answered')
        pk = kwargs.get('pk')
        profile = Profile.objects.get(pk=user_pk)
        log = profile.call_logs['logs'][int(pk)]

        log_date = parser.parse(log['date'])
        point = profile.points.filter(date=log_date.date())
        point_field = PointField.objects.get(name='Calls/Email/Socmed')
        if answered is True:
            point_type = PointLogType.objects.get(name='Add')
            if point.count() == 0:
                attr = PointAttribute.objects.create(attribute=point_field, point=1)
                point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=1)
                create = Point.objects.create()
                create.attributes.add(attr)
                create.logs.add(point_log)
                profile.points.add(create)
                create.date = log_date.date()
                create.save()
            else:
                instance = point[0]
                get_attr = instance.attributes.filter(attribute__name='Calls/Email/Socmed')
                total = 1
                if get_attr.count() > 0:
                    attr = get_attr[0]
                    total = attr.point + 1
                    attr.point = total
                    attr.save()
                else:
                    attr = PointAttribute.objects.create(attribute=point_field, point=total)
                    instance.attributes.add(attr)
                point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total)
                instance.logs.add(point_log)
        else:
            point_type = PointLogType.objects.get(name='Subtract')
            instance = point[0]
            attr = instance.attributes.filter(attribute__name='Calls/Email/Socmed')[0]
            if attr.point > 0:
                total = attr.point - 1
                attr.point = total
                attr.save()
                point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total)
                instance.logs.add(point_log)
        log['answered'] = answered
        profile.save()
        return Response(None, status=status.HTTP_200_OK)

class CallLogsFilter(generics.ListAPIView):
    authentication_classes = (TokenAuthentication, SessionAuthentication,)
    serializer_class = CallLogSerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        a = self.request.query_params.get('a')
        f = self.request.query_params.get('f')
        u = self.request.query_params.get('u')
        answered = True if a == 'true' else False
        date_until = None
        date_from = None
        name = self.request.query_params.get('n')
        call_logs = Profile.objects.get(pk=pk).call_logs

        if f != 'null':
            date_from = parser.parse(f)
        if u != 'null':
            date_until = parser.parse(u)

        if 'logs' in call_logs:
            logs = call_logs['logs']
            def serialize(value):
                i = value[0]
                val = value[1]
                return { 'pk': i, **val }
            mapped = map(serialize, enumerate(logs))
            filtered = mapped

            if name != 'undefined' and date_from is not None and date_until is not None and a != 'undefined':

                def func(value):
                    search = re.search(r'{}'.format(name), value['name'], re.I)
                    answered_val = value['answered'] is answered
                    d = parser.parse(value['date'])
                    date_range = d >= date_from and d <= date_until
                    return search and date_range and answered_val
                filtered = filter(func, mapped)

            elif name != 'undefined' and date_from is not None and date_until is not None:

                def func(value):
                    search = re.search(r'{}'.format(name), value['name'], re.I)
                    d = parser.parse(value['date'])
                    date_range = d >= date_from and d <= date_until
                    return search and date_range
                filtered = filter(func, mapped)

            elif name != 'undefined' and a != 'undefined':

                def func(value):
                    search = re.search(r'{}'.format(name), value['name'], re.I)
                    answered_val = value['answered'] is answered
                    return search and answered_val
                filtered = filter(func, mapped)
            
            elif a != 'undefined' and date_from is not None and date_until is not None:

                def func(value):
                    answered_val = value['answered'] is answered
                    d = parser.parse(value['date'])
                    date_range = d >= date_from and d <= date_until
                    return date_range and answered_val
                filtered = filter(func, mapped)

            elif name != 'undefined':

                def func(value):
                    search = re.search(r'{}'.format(name), value['name'], re.I)
                    return search
                filtered = filter(func, mapped)

            elif a != 'undefined':

                def func(value):
                    answered_val = value['answered'] is answered
                    return answered_val
                filtered = filter(func, mapped)

            elif date_from is not None and date_until is not None:

                def func(value):
                    d = parser.parse(value['date'])
                    date_range = d >= date_from and d <= date_until
                    return date_range
                filtered = filter(func, mapped)

            return filtered
        return []

class CallLogRemark(APIView):
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def put(self, request, *args, **kwargs):
        pk = kwargs.get('user_pk')
        data = request.data
        log_date = parser.parse(data.get('date'))
        profile = Profile.objects.get(pk=pk)
        call_log = None
        for i, log in enumerate(profile.call_logs['logs']):
            d = parser.parse(log['date'])
            if d == log_date:
                call_log = profile.call_logs['logs'][i]
                call_log['remark'] = data['remark']
        profile.save()
        serializer = CallLogSerializer(call_log)
        return Response(serializer.data, status=status.HTTP_200_OK)
