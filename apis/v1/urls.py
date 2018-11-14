from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework import routers
from django.urls import re_path, include
from apis.v1._views.profile import CreateAccountView, ProfileViewSet

router = routers.DefaultRouter()
router.register('profiles', ProfileViewSet)

app_name = 'v1'
urlpatterns = [
    re_path(r'^create-account$', CreateAccountView.as_view(), name='create-account'),
    re_path(r'^', include(router.urls))
]

# urlpatterns = format_suffix_patterns(urlpatterns, allowed=['json', 'html'])