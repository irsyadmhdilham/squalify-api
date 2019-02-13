from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from .. ._models.profile import Profile
from .. ._models.point import Point, PointLogType, PointLog, PointField, PointAttribute
from .. ._models.contact import Contact, ContactType, ContactStatus
from .. ._models.schedule import Schedule
from .serializers import ContactSerializer, CallLogSerializer
import requests
import json
from dateutil import parser

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
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
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
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
        status = ContactStatus.objects.get(status=status_val)
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