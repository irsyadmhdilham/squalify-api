from rest_framework import generics
from .. ._models.agency import Agency
from .serializers import ScoreboardSerializer
from .functions import SalesFilter

class ScoreboardList(generics.ListAPIView):
    serializer_class = ScoreboardSerializer

    def get_queryset(self):
        sales_type = self.request.query_params.get('st')
        period = self.request.query_params.get('p')
        pk = self.kwargs.get('agency_pk')
        members = Agency.objects.get(pk=pk).members
        sf = SalesFilter(members, period, sales_type)
        return sf.result()