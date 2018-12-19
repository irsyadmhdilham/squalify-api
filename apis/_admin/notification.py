from django.contrib import admin
from .._models.notification import Notification, NotificationType

admin.site.register(NotificationType)
admin.site.register(Notification)