from django.conf.urls import url
from .views import CreateAccountView, ProfileDetail

app_name = 'profile'

urlpatterns = [
    url(r'^create-account$', CreateAccountView.as_view(), name='create-account'),
    url(r'^(?P<pk>\d+)$', ProfileDetail.as_view(), name='profile-detail')
]