from django.contrib.auth import authenticate
from rest_framework.views import APIView
from rest_framework import status, exceptions
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from .. ._models.profile import Profile, FcmToken, Designation
from .. ._models.agency import Agency
from .. ._models.group import Group
from account.models import User
from .. .functions.image import ImageMutation
from rest_framework.authentication import SessionAuthentication, BaseAuthentication
from django.utils import timezone
from django.conf import settings
from ..profile.serializers import ProfileImageSerializer, ProfileSerializer

base_dir = settings.BASE_DIR

class EmailAuthentication(BaseAuthentication):

    def authenticate(self, request):
        auth = request.META['HTTP_AUTHORIZATION'].split(':')
        email = auth[0]
        password = auth[1]
        user = authenticate(email=email, password=password)
        if user is None:
            return None
        return (user, None)

class AuthenticationView(APIView):
    authentication_classes = (EmailAuthentication, SessionAuthentication,)

    def post(self, request, *args, **kwargs):
        fcm_token = request.data.get('fcmToken')
        profile = Profile.objects.get(user=request.user)
        data = {
            'user_id': profile.pk,
            'agency_id': profile.agency.pk
        }
        if fcm_token is not None:
            fcm_instance = FcmToken.objects.create(user=profile, token=fcm_token)
            profile.fcm_token.add(fcm_instance)
            data['fcm_id'] = fcm_instance.pk

        """api token"""
        if profile.api_token is None:
            token = Token.objects.create(user=profile.user)
            profile.api_token = token
            profile.save()
            data['token'] = token.key
        else:
            data['token'] = profile.api_token.key
        return Response({'auth': True, 'data': data}, status=status.HTTP_200_OK)

class AdminAuthentication(APIView):
    authentication_classes = (EmailAuthentication, SessionAuthentication)

    def get(self, request, *args, **kwargs):
        user = request.user
        token = Token.objects.get(user=user)
        return Response({'succeed': True, 'token': token.key}, status=status.HTTP_200_OK)

class CheckEmailAvailability(APIView):

    def get(self, request, *args, **kwargs):
        email = request.query_params.get('e')
        user = User.objects.filter(email=email)
        if user.count() > 0:
            return Response(False, status=status.HTTP_200_OK)
        else:
            return Response(True, status=status.HTTP_200_OK)

class SignOut(APIView):

    def post(self, request, *args, **kwargs):
        pk = request.data.get('userId')
        fcm_pk = request.data.get('fcmId')
        try:
            token = FcmToken.objects.get(pk=fcm_pk)
            token.delete()
        except FcmToken.DoesNotExist:
            pass
        return Response(True, status=status.HTTP_200_OK)

class CreateAccount(APIView):

    def post(self, request, *args, **kwargs):
        name = request.data.get('name')
        email = request.data.get('email')
        industry = request.data.get('industry')
        company = request.data.get('company')
        designation = request.data.get('designation')
        upline_id = request.data.get('upline_id')
        agency_id = request.data.get('agency_id')
        profile_image = request.data.get('profile_image')

        # objects
        _designation = Designation.objects.get(name=designation)
        
        if agency_id is not None:
            agency = Agency.objects.get(pk=agency_id)
        
        if upline_id is not None:
            upline = Profile.objects.get(pk=upline_id)

        # check user signed up or not
        check_user = User.objects.filter(email__exact=email).count()
        if check_user > 0:
            return Response('User already signed up', status=status.HTTP_400_BAD_REQUEST)
        user = User.objects.create_user(email, 'Squalify123')
        user.save()

        # create user token
        token = Token.objects.create(user=user)

        profile = Profile.objects.create(
            user=user,
            api_token=token,
            designation=_designation,
            name=name
        )

        if agency is not None:
            profile.agency = agency
            agency.members.add(profile)
        
        if upline is not None:
            profile.upline = upline
            upline.group.members.add(profile)
        
        if designation != 'Unit Trust Consultant':
            group = Group.objects.create(owner=profile)
            profile.group = group

        # profile image
        profile_image._set_name(f'profile_image_{timezone.now().isoformat()}.jpg')
        image = ImageMutation()
        profile.profile_image = profile_image
        profile.save()

        image_path = base_dir + ProfileImageSerializer(profile).data['profile_image']
        image.resize_image(150, image_path)

        serializer = ProfileSerializer(profile)
        return Response(serializer.data, status=status.HTTP_200_OK)