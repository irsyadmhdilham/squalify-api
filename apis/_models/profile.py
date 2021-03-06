from django.db import models
from django.contrib.postgres.fields import JSONField, ArrayField
from django.contrib.auth import get_user_model
from django.conf import settings
from rest_framework.authtoken.models import Token

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

class FcmToken(models.Model):
    token = models.TextField()
    user = models.ForeignKey('Profile', on_delete=models.CASCADE)

    def __str__(self):
        return self.user.name

class ContactVia(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class CallLog(models.Model):
    date = models.DateTimeField(auto_now_add=True)
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE)
    remark = models.CharField(max_length=200, null=True, blank=True)
    answered = models.BooleanField(default=False)
    contact_via = models.ForeignKey(ContactVia, on_delete=models.CASCADE, to_field='name', default='Call')

    def __str__(self):
        constact = self.contact
        return f'{self.contact.name}, {self.date}'

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
    fcm_token = models.ManyToManyField(FcmToken, blank=True)
    api_token = models.OneToOneField(Token, on_delete=models.CASCADE, null=True)
    call_logs = models.ManyToManyField(CallLog, blank=True)

    def __str__(self):
        return f'{self.pk}. {self.name}'