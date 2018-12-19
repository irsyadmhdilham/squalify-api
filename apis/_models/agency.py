from django.db import models
from .post import Post

class Industry(models.Model):
    name = models.CharField(max_length=30)

    class Meta:
        verbose_name_plural = 'Industries'

    def __str__(self):
        return self.name

class Company(models.Model):
    name = models.CharField(max_length=30)

    class Meta:
        verbose_name_plural = 'Companies'

    def __str__(self):
        return self.name

def agency_directory_path(instance, filename):
    return 'agencies/{}/{}'.format(instance.pk, filename)

default_image = 'no_image.jpeg'

class Agency(models.Model):
    name = models.CharField(max_length=200)
    owner = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='agency_owner', null=True, blank=True)
    industry = models.ForeignKey(Industry, on_delete=models.CASCADE)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    agency_image = models.ImageField(upload_to=agency_directory_path, default=default_image)
    members = models.ManyToManyField('Profile', related_name='agency_members')
    posts = models.ManyToManyField(Post, blank=True)

    class Meta:
        verbose_name_plural = 'Agencies'

    def __str__(self):
        return self.name