from rest_framework import viewsets
from apis._models.group import Group
from apis.v1.serializers.group import GroupSerializer

class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer