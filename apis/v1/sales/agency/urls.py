from django.conf.urls import url
from .views import (
    YearAgencySales,
    MonthAgencySales,
    WeekAgencySales,
    TodayAgencySales,
    AgencySummarySales
)

app_name = 'agency-sales'

urlpatterns = [
    url(r'^year/$', YearAgencySales.as_view(), name='year'),
    url(r'^month/$', MonthAgencySales.as_view(), name='month'),
    url(r'^week/$', WeekAgencySales.as_view(), name='week'),
    url(r'^today/$', TodayAgencySales.as_view(), name='today'),
    url(r'^summary/$', AgencySummarySales.as_view(), name='summary'),
]