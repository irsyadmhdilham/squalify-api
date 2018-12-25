from django.db import models
from .post import Post

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

    def __str__(self):
        return '%s %s %s' % (self.notified_by, self.notification_type, self.timestamp)