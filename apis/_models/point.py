from django.db import models

class PointField(models.Model):
    name = models.CharField(max_length=120)

    def __str__(self):
        return self.name

class PointLogType(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class PointLog(models.Model):
    point_type = models.ForeignKey(PointLogType, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    attribute = models.ForeignKey(PointField, on_delete=models.CASCADE)
    point = models.IntegerField(default=0)

    def __str__(self):
        return f'{str(self.timestamp)}, {self.attribute.name}'

class PointAttribute(models.Model):
    attribute = models.ForeignKey(PointField, on_delete=models.CASCADE)
    point = models.IntegerField(default=0)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        date = self.last_modified.date()
        return '{}: {}'.format(str(date), str(self.attribute))

class Point(models.Model):
    attributes = models.ManyToManyField(PointAttribute, related_name='attributes')
    logs = models.ManyToManyField(PointLog, related_name='logs')
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return str(self.date)