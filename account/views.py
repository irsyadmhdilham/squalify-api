from rest_framework import generics, mixins, viewsets
from account.models import User
from account.serializer import UserSerializer

class UserView(generics.ListCreateAPIView):
    serializer_class = UserSerializer
    queryset = User.objects.all()

    def perform_create(self, serializer):
        serializer.save()