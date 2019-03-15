from django.conf.urls import url
from .views import InboxList, InboxDetail, GroupInboxDetail, CreateGroup, CreateGroupImage

app_name = 'inbox'

urlpatterns = [
    url(r'^$', InboxList.as_view(), name='inbox-list'),
    url(r'^create-group/$', CreateGroup.as_view(), name='create-group'),
    url(r'^(?P<pk>\d+)/$', InboxDetail.as_view(), name='inbox-detail'),
    url(r'^(?P<pk>\d+)/group/$', GroupInboxDetail.as_view(), name='group-inbox-detail'),
    url(r'^create-group-image/$', CreateGroupImage.as_view(), name='group-image'),
]