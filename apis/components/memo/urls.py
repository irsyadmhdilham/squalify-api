from django.conf.urls import url
from .views import MemoList, MemoDetail, LikeMemo, UnlikeMemo, CommentMemo, ExtendMemo

app_name = 'memo'

urlpatterns = [
    url(r'^$', MemoList.as_view(), name='memo'),
    url(r'^(?P<pk>\d+)/$', MemoDetail.as_view(), name='memo-detail'),
    url(r'^(?P<pk>\d+)/unlike/$', UnlikeMemo.as_view(), name='unlike-memo'),
    url(r'^(?P<pk>\d+)/comment/$', CommentMemo.as_view(), name='comment-memo'),
    url(r'(?P<pk>\d+)/extend/$', ExtendMemo.as_view(), name='extend-memo'),
    url(r'^like/$', LikeMemo.as_view(), name='like-memo'),
]