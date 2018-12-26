from rest_framework.views import APIView
from rest_framework import generics, status
from rest_framework.response import Response
from .serializers import NotificationSerializer
from .. ._models.profile import Profile
from .. ._models.notification import Notification

class NotificationList(generics.ListCreateAPIView):
    serializer_class = NotificationSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        return profile.notifications.order_by('-timestamp')

class NotificationRead(APIView):

    def get(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        read = profile.notifications.filter(read=False)
        return Response(read.count(), status=status.HTTP_200_OK)

class NotificationDetail(generics.RetrieveUpdateAPIView):
    queryset = Notification.objects.all()
    serializer_class = NotificationSerializer

    def update(self, request, *args, **kwargs):
        notif = self.get_object()
        notif.read = True
        notif.save()
        return Response(True, status=status.HTTP_200_OK)