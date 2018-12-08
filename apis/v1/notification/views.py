from rest_framework import generics
from .serializers import NotificationSerializer
from .. ._models.profile import Profile

class NotificationList(generics.ListCreateAPIView):
    serializer_class = NotificationSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        return profile.notifications