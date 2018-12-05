from django.db import models
from django.contrib.postgres.fields import JSONField

class PointField(models.Model):
    name = models.CharField(max_length=120)

    def __str__(self):
        return self.name

class PointAttribute(models.Model):
    attribute = models.ForeignKey(PointField, on_delete=models.CASCADE)
    point = models.IntegerField(default=0)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        date = self.last_modified.date()
        return '{}: {}'.format(str(date), str(self.attribute))

class Point(models.Model):
    attributes = models.ManyToManyField(PointAttribute, related_name='attributes')
    logs = JSONField(default=dict)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return str(self.date)