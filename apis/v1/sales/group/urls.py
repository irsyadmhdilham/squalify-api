from django.conf.urls import url
from .views import GroupSales, GroupSalesFilter, GroupSalesSummary, GroupDownlines, DownlinesSalesFilter

app_name = 'group-sales'

urlpatterns = [
    url(r'^$', GroupSales.as_view(), name='group'),
    url(r'^filter/$', GroupSalesFilter.as_view(), name='group-filter'),
    url(r'^summary/$', GroupSalesSummary.as_view(), name='group-summary'),
    url(r'^downlines/(?P<pk>\d+)/$', GroupDownlines.as_view(), name='group-downlines'),
    url(r'^downlines/(?P<pk>\d+)/filter/$', DownlinesSalesFilter.as_view(), name='group-downlines-filter'),
]