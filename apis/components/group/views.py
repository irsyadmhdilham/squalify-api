from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from .. ._models.profile import Profile
from .. ._models.group import Group
from .serializers import GroupSerializer, ProfileSerializer

class GroupDetail(generics.RetrieveAPIView):
    serializer_class = GroupSerializer
    
    def get_object(self):
        owner_pk = self.kwargs.get('owner_pk')
        return Profile.objects.get(pk=owner_pk).group

class GroupMembers(generics.ListAPIView):
    serializer_class = ProfileSerializer

    def get_queryset(self):
        pk = self.kwargs.get('group_pk')
        return Group.objects.get(pk=pk).members.all()

class AddGroupMember(APIView):

    def post(self, request, *args, **kwargs):
        pk = kwargs.get('owner_pk')
        downline_id = request.data.get('downlineId')
        owner = Profile.objects.get(pk=pk)
        downline = Profile.objects.get(pk=downline_id)
        owner.group.members.add(downline)
        serializer = ProfileSerializer(downline, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class RemoveGroupMember(APIView):
    
    def delete(self, request, *args, **kwargs):
        pk = kwargs.get('owner_pk')
        downline_id = kwargs.get('downline_id')
        owner = Profile.objects.get(pk=pk)
        downline = Profile.objects.get(pk=downline_id)
        owner.group.members.remove(downline)
        return Response(None, status=status.HTTP_200_OK)