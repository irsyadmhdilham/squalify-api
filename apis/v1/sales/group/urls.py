from django.conf.urls import url
from .views import GroupSales

app_name = 'group-sales'

urlpatterns = [
    url(r'^$', GroupSales.as_view(), name='group'),
]