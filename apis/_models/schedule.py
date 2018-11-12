from django.db import models

class Schedule(models.Model):
    date = models.DateTimeField()
    title = models.CharField(max_length=200)
    remark = models.TextField(blank=True, null=True)
    location = models.CharField(max_length=200)
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title