from django.db import models
from .post import Post
from .inbox import Inbox

class NotificationType(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return self.name

class Notification(models.Model):
    notified_by = models.ForeignKey('Profile', on_delete=models.CASCADE)
    notification_type = models.ForeignKey(NotificationType, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    post_rel = models.ForeignKey(Post, on_delete=models.CASCADE, null=True, blank=True)
    read = models.BooleanField(default=False)
    seen = models.BooleanField(default=False)
    inbox_rel = models.ForeignKey(Inbox, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):

        return f'{self.pk}. {self.notification_type}'