from django.conf.urls import url
from .views import NotificationList

app_name = 'notification'

urlpatterns = [
    url(r'^$', NotificationList.as_view(), name='notification-list'),
]