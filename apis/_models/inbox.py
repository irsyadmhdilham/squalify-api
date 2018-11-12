from django.db import models
from django.contrib.postgres.fields import JSONField

class Conversation(models.Model):
    subscriber = models.ManyToManyField('Profile')
    conversation = JSONField()

class Inbox(models.Model):
    sender = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='senders')
    conversation = models.ForeignKey(Conversation, on_delete=models.CASCADE)
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.sender.name)