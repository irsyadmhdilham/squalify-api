from rest_framework import generics
from apis._models.profile import Profile
from .serializers import SchedulesSerializer

class ScheduleList(generics.ListCreateAPIView):
    serializer_class = SchedulesSerializer
    
    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).schedules