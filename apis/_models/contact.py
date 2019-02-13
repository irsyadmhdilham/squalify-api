from django.db import models

class ContactType(models.Model):
    contact_type = models.CharField(max_length=30)

    def __str__(self):
        return self.contact_type

class ContactStatus(models.Model):
    status = models.CharField(max_length=30, unique=True)

    class Meta:
        verbose_name_plural = 'Contact status'

    def __str__(self):
        return self.status

def contact_directory_path(instance, filename):
    return 'users/{}/contacts/{}'.format(instance.user.id, filename)

class Contact(models.Model):
    name = models.CharField(max_length=200)
    email = models.CharField(max_length=200, null=True, blank=True)
    status = models.ForeignKey(ContactStatus, on_delete=models.CASCADE, to_field='status', default='None')
    contact_type = models.ForeignKey(ContactType, on_delete=models.CASCADE)
    remark = models.TextField(blank=True, null=True)
    contact_no = models.CharField(max_length=30)
    schedules = models.ManyToManyField('Schedule', blank=True, related_name='contacts')
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)
    image = models.ImageField(upload_to=contact_directory_path, null=True, blank=True)
    referrer = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.name