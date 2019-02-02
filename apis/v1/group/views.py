from rest_framework import generics
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from .. ._models.profile import Profile
from .. ._models.group import Group
from .serializers import GroupSerializer

class GroupDetail(generics.RetrieveAPIView):
    serializer_class = GroupSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)
    
    def get_object(self):
        owner_pk = self.kwargs.get('owner_pk')
        return Profile.objects.get(pk=owner_pk).group