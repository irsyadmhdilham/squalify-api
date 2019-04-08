from django.conf.urls import url
from .views import GroupDetail, GroupMembers, AddGroupMember, RemoveGroupMember

app_name = 'group'

urlpatterns = [
    url(r'^$', GroupDetail.as_view(), name='group-detail'),
    url(r'^(?P<group_pk>\d+)/$', GroupMembers.as_view(), name='group-members'),
    url(r'^add-member/$', AddGroupMember.as_view(), name='add-group-member'),
    url(r'^remove-member/(?P<downline_id>\d+)/$', RemoveGroupMember.as_view(), name='remove-group-member'),
]