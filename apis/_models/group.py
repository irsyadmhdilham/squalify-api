from django.db import models

class Group(models.Model):
    owner = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='owners')
    members = models.ManyToManyField('Profile', related_name='group_members', blank=True)

    def __str__(self):
        return str(self.owner.name)