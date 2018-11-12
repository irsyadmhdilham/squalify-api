from django.db import models
from django.conf import settings
from django.contrib.postgres.fields import JSONField

from .referral import Referral
from .schedule import Schedule
from .point import Point
from .group import Group
from .agency import Agency
from .inbox import Inbox
from .notification import Notification
from .sales import Sales

class Designation(models.Model):
    designation = models.CharField(max_length=30)

    def __str__(self):
        return self.designation

class Profile(models.Model):
    name = models.CharField(max_length=200)
    profile_image = models.ImageField()
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    designation = models.ForeignKey(Designation, on_delete=models.CASCADE)
    referrals = models.ManyToManyField(Referral, blank=True)
    schedules = models.ManyToManyField(Schedule, blank=True)
    sales = models.ManyToManyField(Sales, blank=True)
    points = models.ManyToManyField(Point, blank=True)
    group = models.ForeignKey(Group, on_delete=models.CASCADE, blank=True, null=True)
    agency = models.ForeignKey(Agency, on_delete=models.CASCADE)
    notifications = models.ManyToManyField(Notification, blank=True)
    upline = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
    inbox = models.ManyToManyField(Inbox, blank=True)
    settings = JSONField()

    def __str__(self):
        return self.name