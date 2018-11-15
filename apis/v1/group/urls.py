from django.conf.urls import url
from .views import GroupDetail

app_name = 'group'

urlpatterns = [
    url(r'^$', GroupDetail.as_view(), name='group-detail')
]