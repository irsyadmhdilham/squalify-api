from django.urls import path, include
from rest_framework.urlpatterns import format_suffix_patterns
from .views import UserViewSet, CreateAccountViewSet

urlpatterns = [
    path('users', UserViewSet.as_view()),
    path('create-account', CreateAccountViewSet.as_view())
]

urlpatterns = format_suffix_patterns(urlpatterns, allowed=['json', 'html'])
