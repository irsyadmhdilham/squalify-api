from rest_framework import generics
from .. .._models.profile import Profile
from .serializers import GroupSalesSerializer
from ..serializers import SummarySerializer
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
        date_from = self.request.query_params.get('f')
        date_until = self.request.query_params.get('u')
        group = Profile.objects.get(pk=pk).group
        sf = SalesFilter(period, sales_type, status, group.members, date_from, date_until)
        return sf.result()

class GroupSalesSummary(generics.RetrieveAPIView):
    serializer_class = SummarySerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=pk).group.members
    
    def get_object(self):
        sales_type = self.request.query_params.get('st')
        period = self.request.query_params.get('p')
        date_from = self.request.query_params.get('f')
        date_until = self.request.query_params.get('u')
        s = Summary(sales_type, self.get_queryset(), period, date_from, date_until)
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