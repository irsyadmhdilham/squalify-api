from django.conf.urls import url

from .views import ContactList

app_name = 'contact'

urlpatterns = [
    url(r'^$', ContactList.as_view(), name='contact-list')
]