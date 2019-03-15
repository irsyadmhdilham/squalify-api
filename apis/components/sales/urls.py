from django.conf.urls import url, include
from .views import SalesList, SalesDetail, PersonalSummary

app_name = 'sales'

urlpatterns = [
    url(r'^$', SalesList.as_view(), name='sales-list'),
    url(r'^(?P<pk>\d+)/$', SalesDetail.as_view(), name='sales-detail'),
    url(r'^summary/$', PersonalSummary.as_view(), name='sales-summary'),
    url(r'^group/', include('apis.components.sales.group.urls', namespace='group-sales')),
]