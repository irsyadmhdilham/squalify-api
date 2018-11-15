from django.conf.urls import url
from .views import ScheduleList

app_name = 'schedule'

urlpatterns = [
    url(r'^$', ScheduleList.as_view(), name='schedule-list')
]