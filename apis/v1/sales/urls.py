from django.conf.urls import url, include
from .views import SalesList, SalesRemove, PersonalSummary

app_name = 'sales'

urlpatterns = [
    url(r'^$', SalesList.as_view(), name='sales-list'),
    url(r'^(?P<pk>\d+)/$', SalesRemove.as_view(), name='sales-remove'),
    url(r'^summary/personal/$', PersonalSummary.as_view(), name='personal-summary'),
    url(r'^group/', include('apis.v1.sales.group.urls', namespace='group-sales')),
]