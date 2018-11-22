from django.db import models
from django.contrib.postgres.fields import JSONField

class PointField(models.Model):
    name = models.CharField(max_length=120)

    def __str__(self):
        return self.name

class PointAttribute(models.Model):
    point_attr = models.ForeignKey(PointField, on_delete=models.CASCADE)
    point = models.IntegerField(default=0)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return '{}: {}'.format(str(self.timestamp), str(self.field))

class Point(models.Model):
    points = models.ManyToManyField(PointAttribute, related_name='points')
    logs = JSONField(default=dict)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return str(self.date)