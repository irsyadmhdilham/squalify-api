from django.conf.urls import url
from .views import (
    YearGroupSales,
    MonthGroupSales,
    WeekGroupSales,
    TodayGroupSales,
    GroupSummarySales,
    YearDownlineList,
    MonthDownlineList,
    WeekDownlineList,
    TodayDownlineList
)

app_name = 'group-sales'

urlpatterns = [
    url(r'^year/$', YearGroupSales.as_view(), name='year'),
    url(r'^month/$', MonthGroupSales.as_view(), name='month'),
    url(r'^week/$', WeekGroupSales.as_view(), name='week'),
    url(r'^today/$', TodayGroupSales.as_view(), name='today'),
    url(r'^summary/$', GroupSummarySales.as_view(), name='summary'),
    url(r'^(?P<member_pk>\d+)/year/$', YearDownlineList.as_view(), name='downline-year'),
    url(r'^(?P<member_pk>\d+)/month/$', YearDownlineList.as_view(), name='downline-month'),
    url(r'^(?P<member_pk>\d+)/week/$', YearDownlineList.as_view(), name='downline-week'),
    url(r'^(?P<member_pk>\d+)/today/$', YearDownlineList.as_view(), name='downline-today'),
]