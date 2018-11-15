from .views import UserView
from django.conf.urls import url

app_name = 'account'
urlpatterns = [
    url(r'^users/$', UserView.as_view()),
]
