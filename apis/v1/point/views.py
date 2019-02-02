from rest_framework import generics, status
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from .. ._models.profile import Profile
from .. ._models.point import Point, PointField, PointAttribute, PointLog, PointLogType

from .functions.point_calculator import PointCalculator
from .functions.scoreboard import Scoreboard
from django.utils import timezone
from django.db.models import Sum

from .serializers import PointSerializer, ScoreboardSerializer, AllPointsSerializer

class PointList(generics.ListCreateAPIView):
    serializer_class = PointSerializer
    authentication_classes = (TokenAuthentication,)

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

        point_type = PointLogType.objects.get(name='Add')
        if add == False:
            point_type = PointLogType.objects.get(name='Subtract')

        log_ins = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total_point)
        log_ins.save()

        """check whether point for today has already created or not"""
        if get_point.count() == 0:
            create_attr = PointAttribute.objects.create(attribute=point_field, point=total_point)
            create_attr.save()
            instance = serializer.save()
            instance.attributes.add(create_attr)
            instance.logs.add(log_ins)
            profile.points.add(instance)

class PointDetail(generics.RetrieveUpdateAPIView):
    serializer_class = PointSerializer
    queryset = Point.objects.all()
    authentication_classes = (TokenAuthentication,)

    def get_object(self):
        pk = self.kwargs.get('pk')
        query_type = self.request.query_params.get('type')
        point = self.get_queryset().filter(pk=pk)[0]
        if query_type == 'logs':
            values = {
                'date': point.date,
                'logs': point.logs
            }
            return values
        return point

    def perform_update(self, serializer):
        point_pk = self.kwargs.get('pk')
        attr_val = self.request.data.get('attribute')
        attr_pk = self.request.data.get('attr_pk')
        total_point = self.request.data.get('point')
        point_field = PointField.objects.get(name=attr_val)
        add = self.request.query_params.get('add')

        point_type = PointLogType.objects.get(name='Add')
        if add == 'false':
            point_type = PointLogType.objects.get(name='Subtract')

        log_ins = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total_point)
        log_ins.save()
        
        """attribute not create yet, then create one"""
        check_attr = Point.objects.get(pk=point_pk).attributes.filter(attribute__name__exact=attr_val)
        if check_attr.count() == 0:
            create_attr = PointAttribute.objects.create(attribute=point_field, point=total_point)
            create_attr.save()
            get_point = Point.objects.get(pk=point_pk)
            get_point.logs.add(log_ins)
            get_point.attributes.add(create_attr)
            get_point.save()
        else:
            """attribute has been created than just update the attribute"""
            get_point = Point.objects.get(pk=point_pk)
            attr = PointAttribute.objects.get(pk=attr_pk)
            attr.point = total_point
            get_point.logs.add(log_ins)
            get_point.save()
            attr.save()

class ContactPointView(APIView):
    authentication_classes = (TokenAuthentication,)

    def get(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
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
    authentication_classes = (TokenAuthentication,)
    
    def get(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
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

class AllPoints(APIView):
    authentication_classes = (TokenAuthentication,)

    def get(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        personal = profile.points.filter(date=timezone.now().date()).aggregate(total=Sum('attributes__point'))['total']
        agency = profile.agency.members.filter(
            points__date=timezone.now().date()
        ).aggregate(total=Sum('points__attributes__point'))['total']
        if personal is None:
            personal = 0
        if agency is None:
            agency = 0

        group = None
        if profile.group is not None:
            group = profile.group.members.filter(
                points__date=timezone.now().date()
            ).aggregate(total=Sum('points__attributes__point'))['total']
            if group is None:
                group = 0
        data = {
            'personal': personal,
            'agency': agency,
            'group': group
        }
        serializer = AllPointsSerializer(data)
        return Response(serializer.data, status=status.HTTP_200_OK)