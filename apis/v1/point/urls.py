from django.conf.urls import url
from .views import (
    PointList,
    PointDetail,
    ContactPointView,
    ScoreboardPoints
)

app_name = 'point'

urlpatterns = [
    url(r'^$', PointList.as_view(), name='point-list'),
    url(r'^(?P<pk>\d+)/$', PointDetail.as_view(), name='point-detail'),
    url(r'^contact/$', ContactPointView.as_view(), name='contact-points'),
    url(r'^scoreboard/$', ScoreboardPoints.as_view(), name='scoreboard'),
]