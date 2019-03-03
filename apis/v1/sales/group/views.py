from rest_framework import generics
from .. .._models.profile import Profile
from .serializers import GroupSalesSerializer
from .functions.total import TotalSales
from .functions.sales_filter import SalesFilter

class GroupSales(generics.ListAPIView):
    serializer_class = GroupSalesSerializer
    
    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=pk)
        instance = TotalSales(profile.group.members)
        return instance.result()

class GroupSalesFilter(generics.ListAPIView):
    serializer_class = GroupSalesSerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        period = self.request.query_params.get('p')
        sales_type = self.request.query_params.get('st')
        status = self.request.query_params.get('s')
        group = Profile.objects.get(pk=pk).group
        instance = SalesFilter(period, sales_type, status, group.members)
        return instance.result()
