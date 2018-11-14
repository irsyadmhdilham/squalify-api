from django.urls import re_path
from rest_framework.urlpatterns import format_suffix_patterns
from .views import UserView

app_name = 'account'
urlpatterns = [
    re_path(r'^users/$', UserView.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns, allowed=['json', 'html'])
