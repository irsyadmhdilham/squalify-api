from rest_framework import generics
from apis._models.profile import Profile
from apis._models.schedule import Schedule
from .serializers import SchedulesSerializer

class ScheduleList(generics.ListCreateAPIView):
    serializer_class = SchedulesSerializer
    
    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).schedules.all().order_by('-created_on')
    
    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        instance = serializer.save()
        profile.schedules.add(instance)

class ScheduleDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SchedulesSerializer
    lookup_field = 'pk'
    queryset = Schedule.objects.all()

    def perform_destroy(self, instance):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        profile.schedules.remove(instance)
        instance.delete()
