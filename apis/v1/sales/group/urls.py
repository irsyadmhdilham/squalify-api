from django.conf.urls import url
from .views import GroupSales, GroupSalesFilter

app_name = 'group-sales'

urlpatterns = [
    url(r'^$', GroupSales.as_view(), name='group'),
    url(r'^filter/$', GroupSalesFilter.as_view(), name='group-filter'),
]