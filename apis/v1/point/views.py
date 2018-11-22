from rest_framework import generics
from apis._models.profile import Profile
from apis._models.point import Point

from .serializers import PointSerializer

class PointList(generics.ListCreateAPIView):
    serializer_class = PointSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        user = Profile.objects.get(pk=user_pk)
        return user.points.all()

class PointDetail(generics.RetrieveUpdateAPIView):
    serializer_class = PointSerializer
    lookup_field = 'pk'
    queryset = Point.objects.all()