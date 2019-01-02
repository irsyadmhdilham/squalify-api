from django.conf.urls import url
from django.urls import include
from .views import PointList, PointDetail, ContactPointView, ScoreboardPoints, AllPoints

app_name = 'point'

urlpatterns = [
    url(r'^$', PointList.as_view(), name='point-list'),
    url(r'^(?P<pk>\d+)/$', PointDetail.as_view(), name='point-detail'),
    url(r'^contact/$', ContactPointView.as_view(), name='contact-points'),
    url(r'^scoreboard/$', ScoreboardPoints.as_view(), name='scoreboard'),
    url(r'^group/', include('apis.v1.point.group.urls', namespace='group')),
    url(r'^all-points/$', AllPoints.as_view(), name='all-points'),
]