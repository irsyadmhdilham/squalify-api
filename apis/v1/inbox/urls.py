from django.conf.urls import url
from .views import InboxList

app_name = 'inbox'

urlpatterns = [
    url(r'^$', InboxList.as_view(), name='inbox-list'),
]