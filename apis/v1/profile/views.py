from rest_framework import status, generics
from apis._models.profile import Profile
from .serializers import ProfileSerializer

class ProfileDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ProfileSerializer
    queryset = Profile.objects.all()