from rest_framework import generics
from .serializers import MemberSerializer, MemberPointSerializer
from .. .._models.profile import Profile
from django.utils import timezone
from datetime import date
from django.db.models import Sum

class GroupPointList(generics.ListAPIView):
    serializer_class = MemberSerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
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

class GroupMemberPointList(generics.ListAPIView):
    serializer_class = MemberPointSerializer

    def get_queryset(self):
        pk = self.kwargs.get('member_pk')
        profile = Profile.objects.get(pk=pk)
        points = profile.points.all()
        def serialize(val):
            return {
                'date': val.date,
                'point': val.attributes.aggregate(total=Sum('point'))['total']
            }
        map_points = list(map(serialize, points))
        def sort_point(val):
            return val['date']
        map_points.sort(key=sort_point, reverse=True)
        return map_points
