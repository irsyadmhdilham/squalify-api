from django.conf.urls import url
from .views import UserView

app_name = 'account'
urlpatterns = [
    url(r'^users/$', UserView.as_view()),
]
