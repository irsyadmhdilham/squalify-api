from django.db import models
from django.contrib.postgres.fields import JSONField
from django.contrib.auth import get_user_model
from django.conf import settings

from .contact import Contact
from .schedule import Schedule
from .point import Point
from .group import Group
from .agency import Agency
from .inbox import Inbox
from .notification import Notification
from .sales import Sales

import re

User = get_user_model()

class Designation(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return self.name

def default_settings():
    return {
        'social_net_acc': {
            'facebook': None,
            'google': None,
            'dropbox': None
        },
        'notifications': {
            'push_notification': {
                'reminder': True,
                'mentions': True,
                'direct_message': True,
                'activities': True
            },
            'email_notification': True
        }
    }

def user_directory_path(instance, filename):
    return 'users/{}/{}'.format(instance.pk, filename)

default_image = 'no_image.jpeg'

class Profile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    profile_image = models.ImageField(upload_to=user_directory_path, default=default_image)
    designation = models.ForeignKey(Designation, on_delete=models.CASCADE)
    contacts = models.ManyToManyField(Contact, blank=True)
    schedules = models.ManyToManyField(Schedule, blank=True)
    sales = models.ManyToManyField(Sales, blank=True)
    points = models.ManyToManyField(Point, blank=True)
    group = models.ForeignKey(Group, on_delete=models.CASCADE, blank=True, null=True)
    agency = models.ForeignKey(Agency, on_delete=models.CASCADE, null=True, blank=True)
    notifications = models.ManyToManyField(Notification, blank=True)
    upline = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
    inbox = models.ManyToManyField(Inbox, blank=True)
    settings = JSONField(default=default_settings)
    fcm_token = models.TextField(blank=True, null=True)
    is_auth = models.BooleanField(default=False)

    def __str__(self):
        return f'{self.pk}. {self.name}'