from django.conf.urls import url
from .views import AuthenticationView, CreateAccount, SignOut

app_name = 'auth'

urlpatterns = [
    url(r'^$', AuthenticationView.as_view(), name='authenticate'),
    url(r'^sign-out/$', SignOut.as_view(), name='sign-out'),
    url(r'^create/$', CreateAccount.as_view(), name='create-account'),
]