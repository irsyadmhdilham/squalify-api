from django.conf.urls import url
from .views import SalesList

app_name = 'sales'

urlpatterns = [
    url(r'^$', SalesList.as_view(), name='sales-list')
]