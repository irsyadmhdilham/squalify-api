from django.conf.urls import url
from .views import ScoreboardList

app_name = 'scoreboard'

urlpatterns = [
    url(r'^$', ScoreboardList.as_view(), name='scoreboard-list'),
]