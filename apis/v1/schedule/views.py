from rest_framework import generics
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from .. ._models.profile import Profile
from .. ._models.schedule import Schedule
from .serializers import SchedulesSerializer

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
