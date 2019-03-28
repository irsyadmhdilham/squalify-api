from django.conf.urls import url
from .views import PostDetail, CommentList, LikeList, Unlike, PostList, CommentRemove

app_name = 'post'

urlpatterns = [
    url(r'^$', PostList.as_view(), name='post-list'),
    url(r'^(?P<pk>\d+)/$', PostDetail.as_view(), name='post-detail'),
    url(r'^(?P<pk>\d+)/comment/$', CommentList.as_view(), name='comment-list'),
    url(r'^(?P<pk>\d+)/like/$', LikeList.as_view(), name='like-list'),
    url(r'^(?P<post_pk>\d+)/unlike/(?P<pk>\d+)/$', Unlike.as_view(), name='like-detail'),
    url(r'^comment/(?P<pk>\d+)/remove', CommentRemove.as_view(), name='inbox-remove'),
]