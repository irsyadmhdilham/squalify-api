from django.contrib import admin
from .._models.contact import Contact, ContactStatus, ContactType

admin.site.register(ContactStatus)
admin.site.register(Contact)
admin.site.register(ContactType)