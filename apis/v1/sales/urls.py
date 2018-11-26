from django.conf.urls import url
from .views import SalesList, SalesRemove

app_name = 'sales'

urlpatterns = [
    url(r'^$', SalesList.as_view(), name='sales-list'),
    url(r'^(?P<pk>\d+)$', SalesRemove.as_view(), name='sales-remove'),
]