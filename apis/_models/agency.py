from django.db import models
from .post import Post
from .company import Company
from .industry import Industry

class Agency(models.Model):
    name = models.CharField(max_length=200)
    owner = models.OneToOneField('Profile', on_delete=models.CASCADE, related_name='agency_owner')
    industry = models.ForeignKey(Industry, on_delete=models.CASCADE)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    agency_image = models.ImageField()
    members = models.ManyToManyField('Profile', related_name='agency_members')
    posts = models.ManyToManyField(Post, blank=True)

    def __str__(self):
        return self.name