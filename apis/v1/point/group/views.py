from rest_framework import generics
from .serializers import MemberSerializer, MemberPointSerializer, PointsSerializer
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from .. .._models.profile import Profile
from django.utils import timezone
from datetime import date, timedelta
from django.db.models import Sum
import asyncio
from datetime import datetime
from functools import reduce

class GroupPointList(generics.ListAPIView):
    serializer_class = PointsSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        start = self.request.query_params.get('start')
        profile = Profile.objects.get(pk=pk)
        members = profile.group.members.all()

        tday = timezone.now().date()
        event_loop = asyncio.new_event_loop()
        asyncio.set_event_loop(event_loop)

        async def point_calculate(x):
            date = tday - timedelta(days=x)
            def cal_point(member):
                point = member.points.filter(date=date).aggregate(total=Sum('attributes__point'))['total']
                if point is None:
                    return 0
                return point
            map_points = map(cal_point, members)
            total = reduce(lambda a, b: a + b, map_points)
            return { 'date': date, 'total': total }

        tasks = []
        _from = 0
        if start is not None:
            _from = int(start)
        to = _from + 10
        for x in range(_from, to):
            tasks.append(asyncio.ensure_future(point_calculate(x)))
        gather = asyncio.gather(*tasks)
        result = event_loop.run_until_complete(gather)
        event_loop.close()
        return sorted(result, key=lambda val: val['date'], reverse=True)

class GroupMembers(generics.ListAPIView):
    serializer_class = MemberSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        get_date = self.kwargs.get('date')
        profile = Profile.objects.get(pk=pk)
        members = profile.group.members.all()
        date = datetime.strptime(get_date, '%Y-%m-%d')
        def point_cal(points):
            point = points.filter(date=date)
            total = point.aggregate(total=Sum('attributes__point'))['total']
            pk = None
            if point.count() == 0:
                pk = None
            else:
                pk = point[0].pk

            if total is None:
                total = 0
            return { 'pk': pk, 'total': total }

        def serialize(val):
            return {
                'pk': val.pk,
                'name': val.name,
                'profile_image': val.profile_image,
                'designation': val.designation.name,
                'point': point_cal(val.points),
                'downline': None if val.group is None else val.group.members.count()
            }
        map_members = list(map(serialize, members))
        return sorted(map_members, key=lambda val: val['point']['total'], reverse=True)

class GroupMemberPointList(generics.ListAPIView):
    serializer_class = MemberPointSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def get_queryset(self):
        pk = self.kwargs.get('member_pk')
        profile = Profile.objects.get(pk=pk)
        points = profile.points.order_by('-date')
        def serialize(val):
            return {
                'pk': val.pk,
                'date': val.date,
                'point': val.attributes.aggregate(total=Sum('point'))['total']
            }
        map_points = list(map(serialize, points))
        return map_points

class DownlineList(generics.ListAPIView):
    serializer_class = MemberSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def get_queryset(self):
        pk = self.kwargs.get('member_pk')
        profile = Profile.objects.get(pk=pk)
        members = profile.group.members.all()
        def value(val):
            if val is None:
                return 0
            return val
        def serialize(val):
            return {
                'pk': val.pk,
                'name': val.name,
                'profile_image': val.profile_image,
                'designation': val.designation.name,
                'today': value(val.points.filter(date=timezone.now().date()).aggregate(total=Sum('attributes__point'))['total']),
                'downline': None if val.group is None else val.group.members.count()
            }
        map_members = map(serialize, members)
        return map_members
