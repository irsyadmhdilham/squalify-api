from django.conf.urls import url
from django.urls import include
from .views import AgencyDetail, AgencyMembers

app_name = 'agency'

urlpatterns = [
    url(r'^(?P<pk>\d+)/$', AgencyDetail.as_view(), name='agency-detail'),
    url(r'^(?P<agency_pk>\d+)/post/', include('apis.v1.post.urls', namespace='post')),
    url(r'^(?P<pk>\d+)/members/$', AgencyMembers.as_view(), name='agency-members'),
]