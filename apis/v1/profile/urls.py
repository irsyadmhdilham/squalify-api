from django.conf.urls import url
from django.urls import include
from .views import ProfileDetail

app_name = 'profile'

urlpatterns = [
    url(r'^(?P<pk>\d+)$', ProfileDetail.as_view(), name='profile-detail'),
    url(r'^(?P<user_pk>\d+)/contact', include('apis.v1.contact.urls', namespace='contact')),
]