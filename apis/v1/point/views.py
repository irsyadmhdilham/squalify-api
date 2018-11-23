from rest_framework import generics
from apis._models.profile import Profile
from apis._models.point import Point, PointField, PointAttribute
from datetime import datetime

from .serializers import PointSerializer

class PointList(generics.ListCreateAPIView):
    serializer_class = PointSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        mode = self.request.query_params.get('mode')
        profile = Profile.objects.get(pk=user_pk)
        if mode == 'today':
            return profile.points.filter(date__exact=datetime.now().date())
        return profile.points.all()
    
    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        attr_val = self.request.data.get('attribute')
        total_point = self.request.data.get('point')
        profile = Profile.objects.get(pk=user_pk)
        point_field = PointField.objects.get(name=attr_val)
        get_point = profile.points.filter(date__exact=datetime.now().date())
        if get_point.count() == 0:
            create_attr = PointAttribute.objects.create(attribute=point_field, point=total_point)
            create_attr.save()
            instance = serializer.save()
            instance.attributes.add(create_attr)
            profile.points.add(instance)

class PointDetail(generics.RetrieveUpdateAPIView):
    serializer_class = PointSerializer
    lookup_field = 'pk'
    queryset = Point.objects.all()

    def perform_update(self, serializer):
        point_pk = self.kwargs.get('pk')
        attr_val = self.request.data.get('attribute')
        attr_pk = self.request.data.get('attr_pk')
        total_point = self.request.data.get('point')
        point_field = PointField.objects.get(name=attr_val)
        
        """attribute not create yet, then create one"""
        check_attr = Point.objects.get(pk=point_pk).attributes.filter(attribute__name__exact=attr_val)
        if check_attr.count() == 0:
            create_attr = PointAttribute.objects.create(attribute=point_field, point=total_point)
            create_attr.save()
            get_point = Point.objects.get(pk=point_pk)
            get_point.attributes.add(create_attr)
        else:
            """attribute has been created than just update the attribute"""
            attr = PointAttribute.objects.get(pk=attr_pk)
            attr.point = total_point
            attr.save()