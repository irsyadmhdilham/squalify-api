from rest_framework import generics
from ..serializers import SummarySerializer
from .. .._models.agency import Agency

from .functions.summary import Summary

class AgenciesSummary(generics.RetrieveAPIView):
    serializer_class = SummarySerializer
    queryset = Agency.objects.all()

    def get_object(self):
        pk = self.kwargs.get('user_pk')
        period = self.request.query_params.get('p')
        agencies = Agency.objects.filter(company__name='CWA')
        summary = Summary(agencies, period)
        return summary.summary()