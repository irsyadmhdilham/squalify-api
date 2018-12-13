from django.conf.urls import url
from .views import GroupPointList, GroupMemberPointList, DownlineList

app_name = 'group'

urlpatterns = [
    url(r'^$', GroupPointList.as_view(), name='point-list'),
    url(r'^(?P<member_pk>\d+)/$', GroupMemberPointList.as_view(), name='member-points'),
    url(r'^(?P<member_pk>\d+)/downline/$', DownlineList.as_view(), name='downline-list'),
]