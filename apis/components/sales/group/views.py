from rest_framework import generics
from .. .._models.profile import Profile
from .serializers import GroupSalesSerializer, GroupSummarySerializer
from .functions.total import TotalSales
from .functions.sales_filter import SalesFilter
from .functions.summary import Summary

class GroupSales(generics.ListAPIView):
    serializer_class = GroupSalesSerializer
    
    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=pk)
        ts = TotalSales(profile.group.members)
        return ts.result()

class GroupSalesFilter(generics.ListAPIView):
    serializer_class = GroupSalesSerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        period = self.request.query_params.get('p')
        sales_type = self.request.query_params.get('st')
        status = self.request.query_params.get('s')
        group = Profile.objects.get(pk=pk).group
        sf = SalesFilter(period, sales_type, status, group.members)
        return sf.result()

class GroupSalesSummary(generics.RetrieveAPIView):
    serializer_class = GroupSummarySerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=pk).group.members
    
    def get_object(self):
        sales_type = self.request.query_params.get('st')
        s = Summary(sales_type, self.get_queryset())
        return s.result()

class GroupDownlines(generics.ListAPIView):
    serializer_class = GroupSalesSerializer

    def get_queryset(self):
        pk = self.kwargs.get('pk')
        profile = Profile.objects.get(pk=pk)
        ts = TotalSales(profile.group.members)
        return ts.result()

class DownlinesSalesFilter(generics.ListAPIView):
    serializer_class = GroupSalesSerializer

    def get_queryset(self):
        pk = self.kwargs.get('pk')
        period = self.request.query_params.get('p')
        sales_type = self.request.query_params.get('st')
        status = self.request.query_params.get('s')
        group = Profile.objects.get(pk=pk).group
        sf = SalesFilter(period, sales_type, status, group.members)
        return sf.result()