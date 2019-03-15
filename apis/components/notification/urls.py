from django.conf.urls import url
from .views import NotificationList, SeenNotification, NotificationDetail, ClearSeenNotifs

app_name = 'notification'

urlpatterns = [
    url(r'^$', NotificationList.as_view(), name='notification-list'),
    url(r'^(?P<pk>\d+)/$', NotificationDetail.as_view(), name='notification-detail'),
    url(r'^seen/$', SeenNotification.as_view(), name='notification-seen'),
    url(r'^clear-seen/$', ClearSeenNotifs.as_view(), name='clear-seen'),
]