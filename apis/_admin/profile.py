from django.contrib import admin
from .._models.profile import Profile, Designation, FcmToken, CallLog

admin.site.register(Designation)
admin.site.register(Profile)
admin.site.register(FcmToken)
admin.site.register(CallLog)