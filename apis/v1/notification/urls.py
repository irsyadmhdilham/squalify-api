from django.conf.urls import url
from .views import NotificationList, NotificationRead, NotificationDetail

app_name = 'notification'

urlpatterns = [
    url(r'^$', NotificationList.as_view(), name='notification-list'),
    url(r'^(?P<pk>\d+)/$', NotificationDetail.as_view(), name='notification-detail'),
    url(r'^read/$', NotificationRead.as_view(), name='notification-read'),
]