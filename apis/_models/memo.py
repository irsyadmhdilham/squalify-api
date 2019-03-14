from django.db import models
from django.utils import timezone
from .post import Comment, Like
from datetime import timedelta
from django.utils import timezone

def expiry_date():
    now = timezone.now()
    return now + timedelta(weeks=1)

class Memo(models.Model):
    posted_by = models.ForeignKey('Profile', on_delete=models.CASCADE, null=True)
    posted_date = models.DateTimeField(auto_now_add=True, null=True)
    expiry_date = models.DateTimeField(default=expiry_date)
    text = models.TextField()
    countdown = models.DateTimeField(null=True, blank=True)
    likes = models.ManyToManyField(Like, blank=True)
    comments = models.ManyToManyField(Comment, blank=True)

    def __str__(self):
        return self.text