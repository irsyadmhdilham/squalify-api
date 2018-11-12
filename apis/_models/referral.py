from django.db import models

from .schedule import Schedule

class ReferralStatus(models.Model):
    status = models.CharField(max_length=30)

    def __str__(self):
        return self.status

class Referral(models.Model):
    name = models.CharField(max_length=200)
    status = models.ForeignKey(ReferralStatus, on_delete=models.CASCADE)
    remark = models.TextField(blank=True, null=True)
    contact_no = models.CharField(max_length=30)
    schedule = models.ForeignKey(Schedule, on_delete=models.CASCADE, blank=True, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name