from rest_framework import generics
from .. ._models.profile import Profile
from .. ._models.group import Group
from .serializers import GroupSerializer

class GroupDetail(generics.RetrieveAPIView):
    serializer_class = GroupSerializer
    
    def get_object(self):
        owner_pk = self.kwargs.get('owner_pk')
        return Profile.objects.get(pk=owner_pk).group