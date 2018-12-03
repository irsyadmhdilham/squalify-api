from django.conf.urls import url
from .views import AuthenticationView, CreateAccount

app_name = 'auth'

urlpatterns = [
    url(r'^$', AuthenticationView.as_view(), name='authenticate'),
    url(r'^create/$', CreateAccount.as_view(), name='create-account'),
]