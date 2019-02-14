from rest_framework import generics
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from .. ._models.profile import Profile
from .. ._models.schedule import Schedule
from .serializers import SchedulesSerializer
from dateutil import parser
from django.db.models import Q

async def task(num):
    await asyncio.sleep(1)
    print(f'couroutine :{num}')

class ScheduleList(generics.ListCreateAPIView):
    serializer_class = SchedulesSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)
    
    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).schedules.order_by('-date')
    
    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        instance = serializer.save()
        profile.schedules.add(instance)

class ScheduleDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SchedulesSerializer
    lookup_field = 'pk'
    queryset = Schedule.objects.all()
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def perform_destroy(self, instance):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        profile.schedules.remove(instance)
        instance.delete()

class SchedulesFilter(generics.ListAPIView):
    authentication_classes = (TokenAuthentication, SessionAuthentication,)
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
