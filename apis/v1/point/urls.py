from django.conf.urls import url
from .views import PointList, PointDetail, AllPointView

app_name = 'point'

urlpatterns = [
    url(r'^$', PointList.as_view(), name='point-list'),
    url(r'^(?P<pk>\d+)$', PointDetail.as_view(), name='point-detail'),
    url(r'^all$', AllPointView.as_view(), name='all-points'),
]