from django.conf.urls import url
from .views import PostDetail

app_name = 'post'

urlpatterns = [
    url(r'^(?P<pk>\d+)$', PostDetail.as_view(), name='post-detail'),
]