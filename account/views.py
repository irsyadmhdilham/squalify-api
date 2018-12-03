from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from account.models import User
from account.serializer import UserSerializer, PermissionSerializer
from django.contrib.auth.models import Permission

class UserView(generics.ListCreateAPIView):
    serializer_class = UserSerializer
    queryset = User.objects.all()

    def perform_create(self, serializer):
        serializer.save()

class PermissionView(generics.ListCreateAPIView):
    serializer_class = PermissionSerializer
    queryset = Permission.objects.all()