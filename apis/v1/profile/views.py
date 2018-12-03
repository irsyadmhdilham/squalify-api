from rest_framework import status, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from apis._models.profile import Profile
from .serializers import ProfileSerializer

class ProfileDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ProfileSerializer
    queryset = Profile.objects.all()

class PushNotification(APIView):

    def get(self, request, pk):
        settings = Profile.objects.get(pk=pk).settings['notifications']['push_notification']
        return Response(settings, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        profile = Profile.objects.get(pk=pk)
        settings = profile.settings
        subject = request.data.get('subject')
        value = request.data.get('value')
        try:
            push = settings['notifications']['push_notification']
            if subject in push:
                push[subject] = value
            profile.save()
            data = settings['notifications']['push_notification']
            return Response({'Succeed': True, 'data': data}, status=status.HTTP_200_OK)
        except ValueError:
            return Response({'Succeed': False}, status=status.HTTP_400_BAD_REQUEST)

class EmailNotification(APIView):

    def get(self, request, pk):
        settings = Profile.objects.get(pk=pk).settings['notifications']
        return Response(settings, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        profile = Profile.objects.get(pk=pk)
        settings = profile.settings
        value = request.data.get('value')
        try:
            notif = settings['notifications']
            notif['email_notification'] = value
            profile.save()
            return Response({'Succeed': True}, status=status.HTTP_200_OK)
        except ValueError:
            return Response({'Succeed': False}, status=status.HTTP_400_BAD_REQUEST)

