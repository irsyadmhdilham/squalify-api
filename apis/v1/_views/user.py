from django.contrib.auth.models import User
from rest_framework import viewsets
from rest_framework.response import Response
from apis.v1.serializers.user import UserSerializer

class UserViewSet(viewsets.ViewSet):

    def list(self, request):
        queryset = User.objects.all()
        serializer = UserSerializer(queryset, many=True)
        return Response(serializer.data)
    
    def create(self, request):
        