from django.urls import include
from django.conf.urls import url

app_name = 'v1'

urlpatterns = [
    url(r'^profile/', include('apis.v1.profile.urls', namespace='profile')),
    url(r'^agency/', include('apis.v1.agency.urls', namespace='agency')),
    url(r'^auth/', include('apis.v1.auth.urls', namespace='auth')),
]