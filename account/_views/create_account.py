from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from functions.error import Error

from apis._models.agency import Agency
from apis._models.profile import Profile
from apis._models.group import Group
from account.models import User

class CreateAccountViewSet(APIView):

    def post(self, request, format=None):
        email = request.data.get('email')
        password = request.data.get('password')
        try:
            user = User.objects.get(email=email)
            if user is not None:
                raise Exception('User already registered')
            # user = User.objects.create_user(email, password)
            # user.save()
            return Response({'status': 'succeed'}, status=status.HTTP_200_OK)
        except Exception as err:
            error = Error(str(err))
            return Response(error, status=status.HTTP_400_BAD_REQUEST)
