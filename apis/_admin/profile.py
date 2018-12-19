from django.contrib import admin
from .._models.profile import Profile, Designation

admin.site.register(Designation)
admin.site.register(Profile)