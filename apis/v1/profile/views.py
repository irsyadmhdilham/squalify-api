from rest_framework import status, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from apis._models.profile import Profile
from .serializers import ProfileSerializer, ProfileImageSerializer
from .. .functions.image import ImageMutation
from django.conf import settings
from django.utils import timezone
from django.contrib.auth.password_validation import validate_password, ValidationError

base_dir = settings.BASE_DIR

class ProfileDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ProfileSerializer
    queryset = Profile.objects.all()

class ProfileImage(generics.RetrieveUpdateAPIView):
    serializer_class = ProfileImageSerializer
    queryset = Profile.objects.all()

    def update(self, request, *args, **kwargs):
        profile = self.get_object()
        data = request.data.get('profile_image')
        date = timezone.now().isoformat()
        data._set_name(f'profile_image_{date}.jpg')
        old_path = base_dir + self.serializer_class(profile).data['profile_image']
        image = ImageMutation()
        image.remove_image(old_path)
        profile.profile_image = data
        profile.save()
        new_path = base_dir + self.serializer_class(profile).data['profile_image']
        image.resize_image(150, new_path)
        serializer = self.serializer_class(profile, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class PushNotification(APIView):

    def get(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        settings = Profile.objects.get(pk=pk).settings['notifications']['push_notification']
        return Response(settings, status=status.HTTP_200_OK)
    
    def put(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
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

    def get(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        settings = Profile.objects.get(pk=pk).settings['notifications']
        return Response(settings, status=status.HTTP_200_OK)
    
    def put(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
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

class SignOut(APIView):

    def put(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        profile = Profile.objects.get(pk=pk)
        try:
            profile.fcm_token = None
            profile.save()
            return Response({'status': 'user signed out'}, status=status.HTTP_200_OK)
        except Exception as err:
            return Response({'status': 'Failed to signed out'}, status=status.HTTP_400_BAD_REQUEST)

class ChangeEmail(APIView):

    def put(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        email = request.data.get('email')
        new_email = request.data.get('newEmail')
        profile = Profile.objects.get(pk=pk)
        user = profile.user
        if user.email != email:
            return Response({'status': 'Email was same'}, status=status.HTTP_406_NOT_ACCEPTABLE)
        user.email = new_email
        user.save()
        return Response(True, status=status.HTTP_200_OK)

class ChangePassword(APIView):

    def put(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        password = request.data.get('password')
        new_password = request.data.get('newPassword')
        profile = Profile.objects.get(pk=pk)
        user = profile.user
        check_password = user.check_password(password)
        if not check_password:
            return Response({'status': 'Incorrect password'}, status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            validate_password(new_password)
        except ValidationError as err:
            return Response({'status': 'Validation failed', 'error_data': err.error_list}, status=status.HTTP_406_NOT_ACCEPTABLE)
        user.set_password(new_password)
        user.save()
        return Response(True, status=status.HTTP_200_OK)