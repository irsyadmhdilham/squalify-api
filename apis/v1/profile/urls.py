from django.conf.urls import url
from django.urls import include
from .views import ProfileDetail, PushNotification, EmailNotification

app_name = 'profile'

urlpatterns = [
    url(r'^(?P<pk>\d+)/$', ProfileDetail.as_view(), name='profile-detail'),
    url(r'^(?P<user_pk>\d+)/contact/', include('apis.v1.contact.urls', namespace='contact')),
    url(r'^(?P<user_pk>\d+)/schedule/', include('apis.v1.schedule.urls', namespace='schedule')),
    url(r'^(?P<user_pk>\d+)/point/', include('apis.v1.point.urls', namespace='point')),
    url(r'^(?P<user_pk>\d+)/sales/', include('apis.v1.sales.urls', namespace='sales')),
    url(r'^(?P<user_pk>\d+)/group/', include('apis.v1.group.urls', namespace='group')),
    url(r'^(?P<pk>\d+)/settings/push-notifications/$', PushNotification.as_view(), name='push-notifications'),
    url(r'^(?P<pk>\d+)/settings/email-notification/$', EmailNotification.as_view(), name='email-notification'),
]