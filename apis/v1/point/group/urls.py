from django.conf.urls import url
from .views import GroupPointList, GroupMemberPointList

app_name = 'group'

urlpatterns = [
    url(r'^$', GroupPointList.as_view(), name='group-point-list'),
    url(r'^(?P<member_pk>\d+)/$', GroupMemberPointList.as_view(), name='group-member-points'),
]