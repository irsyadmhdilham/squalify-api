from django.conf.urls import url
from .views import InboxList, InboxDetail

app_name = 'inbox'

urlpatterns = [
    url(r'^$', InboxList.as_view(), name='inbox-list'),
    url(r'^(?P<pk>\d+)', InboxDetail.as_view(), name='inbox-detail'),
]