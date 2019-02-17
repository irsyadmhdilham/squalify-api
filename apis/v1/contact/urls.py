from django.conf.urls import url

from .views import (
    ContactList,
    ContactDetail,
    CallLogs,
    CallLogsUpdate,
    ContactFilter,
    CallLogsFilter,
    CallLogRemark
)

app_name = 'contact'

urlpatterns = [
    url(r'^$', ContactList.as_view(), name='contact-list'),
    url(r'^(?P<pk>\d+)/$', ContactDetail.as_view(), name="contact-detail"),
    url(r'^filter/$', ContactFilter.as_view(), name='contact-filter'),
    url(r'^call-logs/filter/$', CallLogsFilter.as_view(), name='call-logs-filter'),
    url(r'^call-logs/$', CallLogs.as_view(), name='call-logs'),
    url(r'^call-logs/(?P<pk>\d+)/$', CallLogsUpdate.as_view(), name='call-logs-detail'),
    url(r'^call-logs/remark', CallLogRemark.as_view(), name="call-logs-remark"),
]