from django.db import models
from .post import Post
from .company import Company
from .industry import Industry
from django.contrib.auth import get_user_model
from django.conf import settings

User = get_user_model()

def agency_directory_path(instance, filename):
    return 'agency/{}/{}'.format(instance.user.id, filename)

default_image = 'no_image.jpeg'

class Agency(models.Model):
    name = models.CharField(max_length=200)
    owner = models.ForeignKey(User, on_delete=models.CASCADE, related_name='agency_owner')
    industry = models.ForeignKey(Industry, on_delete=models.CASCADE)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    agency_image = models.ImageField(upload_to='uploads/agencies', default=default_image)
    members = models.ManyToManyField('Profile', related_name='agency_members')
    posts = models.ManyToManyField(Post, blank=True)

    class Meta:
        verbose_name_plural = 'Agencies'

    def __str__(self):
        return self.name