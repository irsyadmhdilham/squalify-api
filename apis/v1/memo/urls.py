from django.conf.urls import url
from .views import MemoList

app_name = 'memo'

urlpatterns = [
    url(r'^$', MemoList.as_view(), name='memo'),
]