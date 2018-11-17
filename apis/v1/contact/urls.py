from django.conf.urls import url

from .views import ContactList, CreateContact

app_name = 'contact'

urlpatterns = [
    url(r'^$', ContactList.as_view(), name='contact-list'),
    url(r'^create', CreateContact.as_view(), name="create-contact"),
]