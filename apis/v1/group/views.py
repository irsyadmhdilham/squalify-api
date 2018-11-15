from rest_framework import viewsets
from rest_framework.response import Response
from apis._models.group import Group
from apis._models.profile import Profile
from apis.v1.serializers.group import GroupSerializer

class GroupViewSet(viewsets.ViewSet):
    
    def list(self, request):
        queryset = Group.objects.all()
        serializer = GroupSerializer(queryset, many=True)
        return Response(serializer.data, status=200)
    
    def create(self, request):
        owner_id = request.data.get('owner_id')
        industry = request.data.get('industry')
        company = request.data.get('company')
        try:
            get_owner = Profile.objects.get(pk=owner_id)
            group = Group.objects.create(industry=industry, company=company)
            group.owner = get_owner
            group.save()
            serializer = GroupSerializer(group)
            return Response(serializer.data, status=200)
        except Exception as err:
            return Response({'error': str(err)}, status=500)
