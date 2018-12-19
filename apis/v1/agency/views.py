from rest_framework import generics
from apis._models.agency import Agency
from .serializers import AgencySerializer, ProfileSerializer

class AgencyDetail(generics.RetrieveUpdateAPIView):
    serializer_class = AgencySerializer
    queryset = Agency.objects.all()

class AgencyMembers(generics.ListAPIView):
    serializer_class = ProfileSerializer
    
    def get_queryset(self):
        pk = self.kwargs.get('pk')
        agency = Agency.objects.get(pk=pk)
        members = agency.members
        return members
