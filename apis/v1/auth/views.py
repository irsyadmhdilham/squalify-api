from django.contrib.auth import authenticate
from rest_framework.views import APIView
from rest_framework import status, exceptions
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from .. ._models.profile import Profile, FcmToken
from account.models import User
from .. .functions.create_account import CreateAccount
from rest_framework.authentication import TokenAuthentication, SessionAuthentication, BaseAuthentication

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

class SignOut(APIView):
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

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
        data = request.data
        email = data.get('email')
        password = data.get('password')
        name = data.get('name')
        designation = data.get('designation')
        industry = data.get('industry')
        company = data.get('company')
        agency_name = data.get('agency_name')
        upline_id = data.get('upline_id')
        agency_id = data.get('agency_id')

        try:
            """check user signed up or not"""
            check_user = User.objects.filter(email__exact=email).count()
            if check_user is not 0:
                raise ValueError('User already signed up')
            user = User.objects.create_user(email, password)
            user.save()

            """instantiate create account class"""
            create_account = CreateAccount(
                user=user,
                name=name,
                designation=designation,
                industry=industry,
                company=company,
                agency_name=agency_name,
                agency_id=agency_id,
                upline_id=upline_id
            )

            if designation == 'Group Agency Manager':

                """User is Group Agency Manager"""
                
                """Create agency"""
                create_agency = create_account.create_agency()
                
                """Create group"""
                create_group = create_account.create_group()
                
                """create profile"""
                create_profile = create_account.create_profile()
                
                """Add members in agency and group"""
                create_account.add_member_agency()

                return Response({'details': 'Successfully create account'}, status=status.HTTP_200_OK)
            else:

                """User is not Group Agency Manager"""
                
                if designation != 'Unit Trust Constultant':
                    """Create group"""
                    create_group = create_account.create_group()
                
                """Create profile"""
                create_profile = create_account.create_profile()
                
                """Add members in agency and group"""
                create_account.add_member_agency()
                create_account.add_upline_group()

                return Response({'details': 'Successfully create account'}, status=status.HTTP_200_OK)

        except ValueError as err:
            return Response({ 'error': str(err)},status=status.HTTP_400_BAD_REQUEST)