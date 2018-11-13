from django.db import models

class ContactType(models.Model):
    contact_type = models.CharField(max_length=30)

    def __str__(self):
        return self.contact_type

class ReferralStatus(models.Model):
    status = models.CharField(max_length=30)

    def __str__(self):
        return self.status

class Contact(models.Model):
    name = models.CharField(max_length=200)
    status = models.ForeignKey(ReferralStatus, on_delete=models.CASCADE)
    contact_type = models.ForeignKey(ContactType, on_delete=models.CASCADE)
    remark = models.TextField(blank=True, null=True)
    contact_no = models.CharField(max_length=30)
    schedule = models.ManyToManyField('Schedule', on_delete=models.CASCADE, blank=True)
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name