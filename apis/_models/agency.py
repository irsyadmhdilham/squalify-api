from django.db import models
from .post import Post
from .company import Company
from .industry import Industry

def agency_directory_path(instance, filename):
    return 'agency/{}/{}'.format(instance.user.id, filename)

class Agency(models.Model):
    name = models.CharField(max_length=200)
    owner = models.OneToOneField('Profile', on_delete=models.CASCADE, related_name='agency_owner')
    industry = models.ForeignKey(Industry, on_delete=models.CASCADE)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    agency_image = models.ImageField(upload_to=agency_directory_path)
    members = models.ManyToManyField('Profile', related_name='agency_members')
    posts = models.ManyToManyField(Post, blank=True)

    class Meta:
        verbose_name_plural = 'Agencies'

    def __str__(self):
        return self.name