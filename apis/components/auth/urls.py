from django.conf.urls import url
from .views import AuthenticationView, CreateAccount, SignOut, AdminAuthentication, CheckEmailAvailability

app_name = 'auth'

urlpatterns = [
    url(r'^$', AuthenticationView.as_view(), name='authenticate'),
    url(r'^admin-login/$', AdminAuthentication.as_view(), name='admin-authentication'),
    url(r'^sign-out/$', SignOut.as_view(), name='sign-out'),
    url(r'^create/$', CreateAccount.as_view(), name='create-account'),
    url(r'^check-email-availability/$', CheckEmailAvailability.as_view(), name='check-email-availability'),
]