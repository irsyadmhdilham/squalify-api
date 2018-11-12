from rest_framework import routers
from django.urls import path, include
from apis.v1._views.profile import ProfileViewSet
from apis.v1._views.agency import AgencyViewSet
from apis.v1._views.group import GroupViewSet
from apis.v1._views.user import UserViewSet

router = routers.DefaultRouter()
router.register('profiles', ProfileViewSet)
router.register('agencies', AgencyViewSet)
router.register('groups', GroupViewSet)
router.register(r'users', UserViewSet, basename='user')