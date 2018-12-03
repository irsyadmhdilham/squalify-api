from django.conf.urls import url
from .views import UserView, PermissionView

app_name = 'account'
urlpatterns = [
    url(r'^users/$', UserView.as_view()),
    url(r'^permissions/$', PermissionView.as_view()),
]
