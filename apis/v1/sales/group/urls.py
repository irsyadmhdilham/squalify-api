from django.conf.urls import url
from .views import YearGroupSales, MonthGroupSales, WeekGroupSales, TodayGroupSales

app_name = 'group-sales'

urlpatterns = [
    url(r'^year/$', YearGroupSales.as_view(), name='year'),
    url(r'^month/$', MonthGroupSales.as_view(), name='month'),
    url(r'^week/$', WeekGroupSales.as_view(), name='week'),
    url(r'^today/$', TodayGroupSales.as_view(), name='today'),
]