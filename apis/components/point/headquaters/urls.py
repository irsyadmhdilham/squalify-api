from django.conf.urls import url
from .views import AgenciesSummary

app_name = 'headquaters'

urlpatterns = [
    url(r'^summary/$', AgenciesSummary.as_view(), name='agencies-summary'),
]