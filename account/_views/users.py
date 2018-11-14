from rest_framework import status
from rest_framework.views import APIView
from account.models import User
from account.serializer import UserSerializer
from rest_framework.response import Response
from functions.error import Error

class UserViewSet(APIView):

    def get(self, request, format=None):
        try:
            queryset = User.objects.all()
            serializer = UserSerializer(queryset, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except User.UserNotFound as err:
            error = Error(str(err))
            return Response(error ,status=status.HTTP_400_BAD_REQUEST)
    
    def post(self, request, format=None):
        email = request.data.get('email')
        password = request.data.get('password')
        try:
            user = User.objects.create_user(email, password)
            user.save()
            serializer = UserSerializer(user)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except ValueError as err:
            error = Error(str(err))
            return Response(error, status=status.HTTP_400_BAD_REQUEST)