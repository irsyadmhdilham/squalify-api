from django.urls import include
from django.conf.urls import url

from .profile import urls as profile_urls

app_name = 'v1'

urlpatterns = [
    url(r'^profile/', include(profile_urls, namespace='profile'))
]