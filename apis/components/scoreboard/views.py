from rest_framework import generics
from .. ._models.agency import Agency
from .serializers import ScoreboardSerializer
from .functions import SalesFilter

class ScoreboardList(generics.ListAPIView):
    serializer_class = ScoreboardSerializer

    def get_queryset(self):
        sales_type = self.request.query_params.get('st')
        period = self.request.query_params.get('p')
        date_from = self.request.query_params.get('f')
        date_until = self.request.query_params.get('u')
        pk = self.kwargs.get('agency_pk')
        members = Agency.objects.get(pk=pk).members
        sf = SalesFilter(members, period, sales_type, date_from, date_until)
        return sf.result()