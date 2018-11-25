from django.urls import include
from django.conf.urls import url
from .create_account import CreateAccountView

from .profile import urls as profile_urls
from .agency import urls as agency_urls

app_name = 'v1'

urlpatterns = [
    url(r'^profile/', include(profile_urls, namespace='profile')),
    url(r'^create-account$', CreateAccountView.as_view(), name='create-account'),
    url(r'^agency/', include(agency_urls, namespace='agency')),
]