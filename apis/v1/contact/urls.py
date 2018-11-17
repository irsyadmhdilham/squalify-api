from django.conf.urls import url

from .views import ContactList, ContactDetail

app_name = 'contact'

urlpatterns = [
    url(r'^$', ContactList.as_view(), name='contact-list'),
    url(r'^(?P<pk>\d+)$', ContactDetail.as_view(), name="contact-detail"),
]