from django.db import models
from django.utils import timezone

class Memo(models.Model):
    posted_by = models.ForeignKey('Profile', on_delete=models.CASCADE, null=True)
    posted_date = models.DateTimeField(auto_now_add=True, null=True)
    start_date = models.DateTimeField(default=timezone.now)
    end_date = models.DateTimeField()
    text = models.TextField()
    countdown = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f'{str(self.start_date)}-{str(self.end_date)}: {self.text}'