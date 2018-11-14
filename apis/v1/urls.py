from rest_framework import routers
from rest_framework.urlpatterns import format_suffix_patterns
from django.urls import path, include
from apis.v1._views.profile import ProfileViewSet
from apis.v1._views.agency import AgencyViewSet
from apis.v1._views.group import GroupViewSet

router = routers.DefaultRouter()
router.register('profiles', ProfileViewSet)
router.register('agencies', AgencyViewSet)
router.register(r'groups', GroupViewSet, basename='groups')

urlpatterns = [
    path('', include(router.urls))
]