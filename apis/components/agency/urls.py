from django.conf.urls import url
from django.urls import include
from .views import AgencyDetail, AgencyMembers, AgencyImage, AllAgencies

app_name = 'agency'

urlpatterns = [
    url(r'^(?P<pk>\d+)/$', AgencyDetail.as_view(), name='agency-detail'),
    url(r'^(?P<pk>\d+)/agency-image/$', AgencyImage.as_view(), name='agency-image'),
    url(r'^(?P<agency_pk>\d+)/post/', include('apis.components.post.urls', namespace='post')),
    url(r'^(?P<pk>\d+)/members/$', AgencyMembers.as_view(), name='agency-members'),
    url(r'^(?P<agency_pk>\d+)/memo/', include('apis.components.memo.urls', namespace='memo')),
    url(r'^(?P<agency_pk>\d+)/scoreboard/', include('apis.components.scoreboard.urls', namespace='scoreboard')),
    url(r'^$', AllAgencies.as_view(), name='agencies'),
]