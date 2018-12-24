from django.conf.urls import url
from .views import InboxList, InboxDetail, GroupInboxDetail

app_name = 'inbox'

urlpatterns = [
    url(r'^$', InboxList.as_view(), name='inbox-list'),
    url(r'^(?P<pk>\d+)/$', InboxDetail.as_view(), name='inbox-detail'),
    url(r'^(?P<pk>\d+)/group/$', GroupInboxDetail.as_view(), name='group-inbox-detail'),
]