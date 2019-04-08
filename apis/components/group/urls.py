from django.conf.urls import url
from .views import GroupDetail, GroupMembers

app_name = 'group'

urlpatterns = [
    url(r'^$', GroupDetail.as_view(), name='group-detail'),
    url(r'^(?P<group_pk>\d+)/$', GroupMembers.as_view(), name='group-members'),
]