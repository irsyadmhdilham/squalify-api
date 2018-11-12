from rest_framework import viewsets
from apis._models.profile import Profile
from apis.v1.serializers.profile import ProfileSerializer

class ProfileViewSet(viewsets.ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer