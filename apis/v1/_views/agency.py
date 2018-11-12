from rest_framework import viewsets
from apis._models.agency import Agency
from apis.v1.serializers.agency import AgencySerializer

class AgencyViewSet(viewsets.ModelViewSet):
    queryset = Agency.objects.all()
    serializer_class = AgencySerializer