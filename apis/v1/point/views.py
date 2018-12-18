from rest_framework import generics, status
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework.response import Response
from .. ._models.profile import Profile
from .. ._models.point import Point, PointField, PointAttribute

from .functions.point_calculator import PointCalculator
from .functions.scoreboard import Scoreboard
from django.utils import timezone

from .serializers import PointSerializer, ScoreboardSerializer

class PointList(generics.ListCreateAPIView):
    serializer_class = PointSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        mode = self.request.query_params.get('mode')
        profile = Profile.objects.get(pk=user_pk)
        if mode == 'today':
            return profile.points.filter(date__exact=timezone.now().date())
        return profile.points.all().order_by('-date')
    
    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        attr_val = self.request.data.get('attribute')
        total_point = self.request.data.get('point')
        add = self.request.data.get('add')
        profile = Profile.objects.get(pk=user_pk)
        point_field = PointField.objects.get(name=attr_val)
        get_point = profile.points.filter(date__exact=timezone.now().date())

        point_type = 'add'
        if add == False:
            point_type = 'subtract'
        
        log_init = {
            'logs': [
                { 
                    'type': point_type,
                    'time': timezone.now().isoformat(),
                    'attribute': point_field.name,
                    'point': total_point 
                }
            ] 
        }

        """check whether point for today has already created or not"""
        if get_point.count() == 0:
            create_attr = PointAttribute.objects.create(attribute=point_field, point=total_point)
            create_attr.save()
            instance = serializer.save(logs=log_init)
            instance.attributes.add(create_attr)
            profile.points.add(instance)

class PointDetail(generics.RetrieveUpdateAPIView):
    serializer_class = PointSerializer

    def get_queryset(self):
        pk = self.kwargs.get('pk')
        query_type = self.request.query_params.get('type')
        if query_type == 'logs':
            return Point.objects.filter(pk=pk).values('date', 'logs')
        return Point.objects.filter(pk=pk)

    def perform_update(self, serializer):
        point_pk = self.kwargs.get('pk')
        attr_val = self.request.data.get('attribute')
        attr_pk = self.request.data.get('attr_pk')
        total_point = self.request.data.get('point')
        point_field = PointField.objects.get(name=attr_val)
        add = self.request.query_params.get('add')

        point_type = 'add'
        if add == 'false':
            point_type = 'subtract'

        log = {
            'type': point_type,
            'time': timezone.now().isoformat(),
            'attribute': attr_val,
            'point': total_point 
        }
        
        """attribute not create yet, then create one"""
        check_attr = Point.objects.get(pk=point_pk).attributes.filter(attribute__name__exact=attr_val)
        if check_attr.count() == 0:
            create_attr = PointAttribute.objects.create(attribute=point_field, point=total_point)
            create_attr.save()
            get_point = Point.objects.get(pk=point_pk)
            get_point.logs['logs'].append(log)
            get_point.attributes.add(create_attr)
            get_point.save()
        else:
            """attribute has been created than just update the attribute"""
            get_point = Point.objects.get(pk=point_pk)
            attr = PointAttribute.objects.get(pk=attr_pk)
            attr.point = total_point
            get_point.logs['logs'].append(log)
            get_point.save()
            attr.save()

class ContactPointView(APIView):

    def get(self, request, user_pk):
        referrals = PointCalculator(user_pk, 'Referrals')
        ftf = PointCalculator(user_pk, 'FTF/Nesting/Booth')
        calls = PointCalculator(user_pk, 'Calls/Email/Socmed')
        app_sec = PointCalculator(user_pk, 'Appointment secured')
        data = {
            'pk': referrals.today_pk(),
            'referrals': referrals.today_total(),
            'ftf': ftf.today_total(),
            'calls': calls.today_total(),
            'app_sec':app_sec.today_total()
        }
        return Response(data, status=status.HTTP_200_OK)

class ScoreboardPoints(APIView):
    
    def get(self, request, user_pk):
        profile = Profile.objects.get(pk=user_pk)
        members = profile.agency.members.all()
        q = request.query_params.get('q')
        scoreboard = Scoreboard(members)
        data = None
        if q == 'month':
            data = scoreboard.month(True)
        elif q == 'today':
            data = scoreboard.today(True)
        elif q == 'week':
            data = scoreboard.week(True)
        else:
            data = scoreboard.year(True)
        serializer = ScoreboardSerializer(data, many=True, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)
