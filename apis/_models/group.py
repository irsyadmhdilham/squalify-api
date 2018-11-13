from django.db import models

from .company import Company
from .industry import Industry

class Group(models.Model):
    owner = models.OneToOneField('Profile', on_delete=models.CASCADE, related_name='owners')
    members = models.ManyToManyField('Profile', related_name='group_members', blank=True)
    industry = models.ForeignKey(Industry, on_delete=models.CASCADE)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)

    def __str__(self):
        return self.owner