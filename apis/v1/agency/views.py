from rest_framework import generics
from apis._models.agency import Agency
from apis._models.profile import Profile
from .serializers import AgencySerializer

class AgencyDetail(generics.RetrieveUpdateAPIView):
    serializer_class = AgencySerializer
    queryset = Agency.objects.all()

