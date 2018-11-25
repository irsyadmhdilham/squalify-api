from django.conf.urls import url
from .views import AgencyDetail

app_name = 'agency'

urlpatterns = [
    url(r'^(?P<pk>\d+)/$', AgencyDetail.as_view(), name='agency-detail'),
]