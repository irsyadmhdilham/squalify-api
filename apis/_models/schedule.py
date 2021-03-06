from django.db import models
from .contact import Contact
from django.contrib.postgres.fields import JSONField

class Schedule(models.Model):
    date = models.DateTimeField()
    title = models.CharField(max_length=200)
    remark = models.TextField(blank=True, null=True)
    location = models.CharField(max_length=200)
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE, null=True, blank=True)
    reminder = models.DateTimeField(null=True, blank=True)
    created_by = models.ForeignKey('Profile', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.title