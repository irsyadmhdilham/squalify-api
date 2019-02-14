from django.conf.urls import url
from .views import ScheduleList, ScheduleDetail, SchedulesFilter

app_name = 'schedule'

urlpatterns = [
    url(r'^$', ScheduleList.as_view(), name='schedule-list'),
    url(r'^(?P<pk>\d+)/$', ScheduleDetail.as_view(), name='schedule-detail'),
    url(r'^filter/$', SchedulesFilter.as_view(), name='schedule-filter'),
]