from django.urls import include
from django.conf.urls import url

app_name = 'apis'

urlpatterns = [
    url(r'^profile/', include('apis.components.profile.urls', namespace='profile')),
    url(r'^agency/', include('apis.components.agency.urls', namespace='agency')),
    url(r'^auth/', include('apis.components.auth.urls', namespace='auth')),
]