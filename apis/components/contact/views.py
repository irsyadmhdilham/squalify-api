from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from .. ._models.profile import Profile, CallLog, ContactVia
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

        # # Add point
        # if contact_type_val == 'Referral':
        #     pt = 'Referrals'
        # elif contact_type_val == 'Face to face' or contact_type_val == 'Nesting' or contact_type_val == 'Booth':
        #     pt = 'FTF/Nesting/Booth'

        # point = profile.points.filter(date=timezone.now().date())
        # point_field = PointField.objects.get(name=pt)
        # point_type = PointLogType.objects.get(name='Add')
        # if point.count() == 0:
        #     attr = PointAttribute.objects.create(attribute=point_field, point=1 if pt == 'Referrals' else 2)
        #     point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=1 if pt == 'Referrals' else 2)
        #     create = Point.objects.create()
        #     create.attributes.add(attr)
        #     create.logs.add(point_log)
        #     profile.points.add(create)
        # else:
        #     p = point[0]
        #     get_attr = p.attributes.filter(attribute__name=pt)

        #     total = 1 if pt == 'Referrals' else 2
        #     if get_attr.count() > 0:
        #         attr = get_attr[0]
        #         total = attr.point + 1 if pt == 'Referrals' else 2
        #         attr.point = total
        #         attr.save()
        #     else:
        #         attr = PointAttribute.objects.create(attribute=point_field, point=total)
        #         p.attributes.add(attr)
        #     point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total)
        #     p.logs.add(point_log)

class ContactDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer

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

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).call_logs.order_by('-date')
    
    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        contact_pk = self.request.data.get('contactId')
        status = self.request.data.get('status')
        called = self.request.query_params.get('c')
        _contact_via = self.request.data.get('contactVia')

        contact = Contact.objects.get(pk=contact_pk)
        profile = Profile.objects.get(pk=user_pk)
        contact_via = ContactVia.objects.get(name=_contact_via)
        instance = None

        if called == 'true':
            instance = serializer.save(contact=contact, answered=True, contact_via=contact_via)
            
            point = profile.points.filter(date=timezone.now().date())
            point_field = PointField.objects.get(name='Calls/Email/Socmed')
            # If contact status not None, point field = Servicing/Follow up
            if status != 'None':
                point_field = PointField.objects.get(name='Servicing/Follow up')

            point_type = PointLogType.objects.get(name='Add')
            if point.count() == 0:
                attr = PointAttribute.objects.create(attribute=point_field, point=1)
                point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=1)
                create = Point.objects.create()
                create.attributes.add(attr)
                create.logs.add(point_log)
                profile.points.add(create)
            else:
                p = point[0]

                get_attr = p.attributes.filter(attribute__name='Calls/Email/Socmed')
                if status != 'None':
                    get_attr = p.attributes.filter(attribute__name='Servicing/Follow up')

                total = 1
                if get_attr.count() > 0:
                    attr = get_attr[0]
                    total = attr.point + 1
                    attr.point = total
                    attr.save()
                else:
                    attr = PointAttribute.objects.create(attribute=point_field, point=total)
                    p.attributes.add(attr)
                point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total)
                p.logs.add(point_log)
        else:
            instance = serializer.save(contact=contact, contact_via=contact_via)
        Profile.objects.get(pk=user_pk).call_logs.add(instance)


class CallLogsDetail(generics.RetrieveUpdateAPIView):
    serializer_class = CallLogSerializer
    queryset = CallLog.objects.all()

    def perform_update(self, serializer):
        answered = self.request.data.get('answered')
        user_pk = self.kwargs.get('user_pk')
        _contact_via = self.request.data.get('contactVia')

        profile = Profile.objects.get(pk=user_pk)
        contact_via = ContactVia.objects.get(name=_contact_via)

        # check answered value available or not
        if answered is not None:
            log = self.get_object()
            point = profile.points.filter(date=log.date)

            point_field = PointField.objects.get(name='Calls/Email/Socmed')
            # If contact status not None, point field = Servicing/Follow up
            if log.contact.status != 'None':
                point_field = PointField.objects.get(name='Servicing/Follow up')

            if answered is True:
                point_type = PointLogType.objects.get(name='Add')
                if point.count() == 0:
                    attr = PointAttribute.objects.create(attribute=point_field, point=1)
                    point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=1)
                    create = Point.objects.create()
                    create.attributes.add(attr)
                    create.logs.add(point_log)
                    profile.points.add(create)
                else:
                    instance = point[0]

                    get_attr = instance.attributes.filter(attribute__name='Calls/Email/Socmed')
                    if log.contact.status != 'None':
                        get_attr = instance.attributes.filter(attribute__name='Servicing/Follow up')

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
                if log.contact.status != 'None':
                    attr = instance.attributes.filter(attribute__name='Servicing/Follow up')[0]

                if attr.point > 0:
                    total = attr.point - 1
                    attr.point = total
                    attr.save()
                    point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total)
                    instance.logs.add(point_log)
        serializer.save(contact_via=contact_via)

class CallLogsFilter(generics.ListAPIView):
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

        if name != 'undefined' and date_from is not None and date_until is not None and a != 'undefined':
            return call_logs.filter(
                Q(contact__name__icontains=name) &
                Q(date__range=(date_from, date_until)) &
                Q(answered=answered)
            ).order_by('-date')
        elif name != 'undefined' and date_from is not None and date_until is not None:
            return call_logs.filter(
                Q(contact__name__icontains=name) &
                Q(date__range=(date_from, date_until))
            ).order_by('-date')
        elif name != 'undefined' and a != 'undefined':
            return call_logs.filter(
                Q(contact__name__icontains=name) &
                Q(answered=answered)
            ).order_by('-date')
        elif a != 'undefined' and date_from is not None and date_until is not None:
            return call_logs.filter(
                Q(date__range=(date_from, date_until)) &
                Q(answered=answered)
            ).order_by('-date')
        elif name != 'undefined':
            return call_logs.filter(contact__name__icontains=name).order_by('-date')
        elif a != 'undefined':
            return call_logs.filter(answered=answered).order_by('-date')
        elif date_from is not None and date_until is not None:
            return call_logs.filter(date__range=(date_from, date_until)).order_by('-date')
        else:
            return call_logs.order_by('-date')
