from django.conf.urls import url
from .views import MemoList, MemoDetail

app_name = 'memo'

urlpatterns = [
    url(r'^$', MemoList.as_view(), name='memo'),
    url(r'^(?P<pk>\d+)', MemoDetail.as_view(), name='memo-detail'),
]