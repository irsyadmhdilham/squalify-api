from rest_framework import generics
from .. ._models.profile import Profile
from .. ._models.schedule import Schedule
from .serializers import SchedulesSerializer
from dateutil import parser
from django.utils import timezone
from django.db.models import Q
from datetime import timedelta
from .functions.reminder import Reminder
from .functions.update_reminder import UpdateReminder

class ScheduleList(generics.ListCreateAPIView):
    serializer_class = SchedulesSerializer
    
    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).schedules.order_by('-date')
    
    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        sd = parser.parse(self.request.data.get('date'))
        rd = self.request.data.get('reminderDate')
        multi_assign = self.request.data.get('multiAssign')
        assigned_members = self.request.data.get('assignedMembers')
        profile = Profile.objects.get(pk=user_pk)
        instance = None
        if rd is not None:
            reminder = Reminder(sd, rd)
            instance = serializer.save(reminder=reminder.reminder(), created_by=profile)
        else:
            instance = serializer.save(created_by=profile)
        if multi_assign is not None:
            if multi_assign == 'agency':
                members = profile.agency.members.exclude(pk=profile.pk)
                for member in members:
                    member.schedules.add(instance)
            elif multi_assign == 'group':
                members = profile.group.members.exclude(pk=profile.pk)
                for member in members:
                    member.schedules.add(instance)
            elif multi_assign == 'select':
                members = Profile.objects.in_bulk(assigned_members)
                for key, member in members.items():
                    member.schedules.add(instance)
        profile.schedules.add(instance)

class ScheduleDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SchedulesSerializer
    lookup_field = 'pk'
    queryset = Schedule.objects.all()

    def perform_update(self, serializer):
        rd = self.request.data.get('reminderDate')
        clear = self.request.data.get('clearReminder')
        date = parser.parse(self.request.data.get('date'))
        if clear:
            serializer.save(reminder=None)
        else:
            if rd is not None:
                reminder = UpdateReminder(date, rd)
                serializer.save(reminder=reminder.reminder())
            else:
                serializer.save()

    def perform_destroy(self, instance):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        profile.schedules.remove(instance)
        instance.delete()

class SchedulesFilter(generics.ListAPIView):
    serializer_class = SchedulesSerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        schedules = Profile.objects.get(pk=pk).schedules
        title = self.request.query_params.get('t')
        remark = self.request.query_params.get('r')
        location = self.request.query_params.get('l')
        f = self.request.query_params.get('f')
        u = self.request.query_params.get('u')

        result = schedules.order_by('-date')

        date_from = None
        date_until = None
        if f != 'null':
            date_from = parser.parse(f)
        if u != 'null':
            date_until = parser.parse(u)
        
        if title != 'undefined' and remark != 'undefined' and location != 'undefined' and date_from is not None and date_until is not None:
            result = schedules.filter(
                Q(title__icontains=title) &
                Q(remark__icontains=remark) &
                Q(location__icontains=location) &
                Q(date__range=(date_from, date_until))
            )
        elif title != 'undefined' and remark != 'undefined' and location != 'undefined':
            result = schedules.filter(
                Q(title__icontains=title) &
                Q(remark__icontains=remark) &
                Q(location__icontains=location)
            )
        elif date_from is not None and date_until is not None and remark != 'undefined' and location != 'undefined':
            result = schedules.filter(
                Q(remark__icontains=remark) &
                Q(location__icontains=location) &
                Q(date__range=(date_from, date_until))
            )
        elif date_from is not None and date_until is not None and title != 'undefined' and remark != 'undefined':
            result = schedules.filter(
                Q(title__icontains=title) &
                Q(remark__icontains=remark) &
                Q(date__range=(date_from, date_until))
            )
        elif date_from is not None and date_until is not None and title != 'undefined' and location != 'undefined':
            result = schedules.filter(
                Q(title__icontains=title) &
                Q(location__icontains=location) &
                Q(date__range=(date_from, date_until))
            )
        elif date_from is not None and date_until is not None and title != 'undefined':
            result = schedules.filter(
                Q(title__icontains=title) &
                Q(date__range=(date_from, date_until))
            )
        elif date_from is not None and date_until is not None and location != 'undefined':
            result = schedules.filter(
                Q(location__icontains=location) &
                Q(date__range=(date_from, date_until))
            )
        elif date_from is not None and date_until is not None and remark != 'undefined':
            result = schedules.filter(
                Q(remark__icontains=remark) &
                Q(date__range=(date_from, date_until))
            )
        elif location != 'undefined' and remark != 'undefined':
            result = schedules.filter(
                Q(remark__icontains=remark) &
                Q(location__icontains=location)
            )
        elif location != 'undefined' and title != 'undefined':
            result = schedules.filter(
                Q(title__icontains=title) &
                Q(location__icontains=location)
            )
        elif remark != 'undefined' and title != 'undefined':
            result = schedules.filter(
                Q(title__icontains=title) &
                Q(remark__icontains=remark)
            )
        elif remark != 'undefined':
            result = schedules.filter(remark__icontains=remark)
        elif location != 'undefined':
            result = schedules.filter(location__icontains=location)
        elif title != 'undefined':
            result = schedules.filter(title__icontains=title)
        elif date_from is not None and date_until is not None:
            result = schedules.filter(date__range=(date_from, date_until))

        return result

class ScheduleReminders(generics.ListAPIView):
    serializer_class = SchedulesSerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=pk)
        return profile.schedules.filter(reminder__gt=timezone.now())

class ScheduleMonthFilter(generics.ListAPIView):
    serializer_class = SchedulesSerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        m = int(self.request.query_params.get('m'))
        schedules = Profile.objects.get(pk=pk).schedules
        if m == 0:
            return schedules.order_by('-date')
        else:
            return schedules.filter(date__month=m).order_by('-date')
