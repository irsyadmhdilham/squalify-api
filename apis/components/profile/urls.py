from django.conf.urls import url
from django.urls import include
from .views import (
    ProfileDetail,
    PushNotification,
    EmailNotification,
    ProfileImage,
    ChangeEmail,
    ChangePassword,
    AllProfiles,
    ResetPassword
)

app_name = 'profile'

urlpatterns = [
    url(r'^(?P<pk>\d+)/$', ProfileDetail.as_view(), name='profile-detail'),
    url(r'^(?P<pk>\d+)/profile-image/$', ProfileImage.as_view(), name='profile-image'),
    url(r'^(?P<user_pk>\d+)/contact/', include('apis.components.contact.urls', namespace='contact')),
    url(r'^(?P<user_pk>\d+)/schedule/', include('apis.components.schedule.urls', namespace='schedule')),
    url(r'^(?P<user_pk>\d+)/point/', include('apis.components.point.urls', namespace='point')),
    url(r'^(?P<user_pk>\d+)/sales/', include('apis.components.sales.urls', namespace='sales')),
    url(r'^(?P<owner_pk>\d+)/group/', include('apis.components.group.urls', namespace='group')),
    url(r'^(?P<user_pk>\d+)/inbox/', include('apis.components.inbox.urls', namespace='inbox')),
    url(r'(?P<user_pk>\d+)/notification/', include('apis.components.notification.urls', namespace='notification')),
    url(r'^(?P<pk>\d+)/settings/push-notifications/$', PushNotification.as_view(), name='push-notifications'),
    url(r'^(?P<pk>\d+)/settings/email-notification/$', EmailNotification.as_view(), name='email-notification'),
    url(r'^(?P<pk>\d+)/change-email/$', ChangeEmail.as_view(), name='change-email'),
    url(r'^(?P<pk>\d+)/change-password/$', ChangePassword.as_view(), name='change-password'),
    url(r'^$', AllProfiles.as_view(), name='all-profiles'),
    url(r'^(?P<pk>\d+)/reset-password/$', ResetPassword.as_view(), name='reset-password'),
]