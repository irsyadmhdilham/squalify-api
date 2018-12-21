from django.db import models

class ChatMessage(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    person = models.ForeignKey('Profile', on_delete=models.CASCADE)
    text = models.TextField()

    def __str__(self):
        person = self.person.name
        timestamp = str(self.timestamp)
        return f'{timestamp} > {person}'

class GroupChat(models.Model):
    messages = models.ManyToManyField(ChatMessage)
    owner = models.ForeignKey('Profile', on_delete=models.CASCADE, blank=True, null=True)
    participants = models.ManyToManyField('Profile', related_name='chats', blank=True)

    def __str__(self):
        person = self.owner.name
        return '{}'.format(person)

class Inbox(models.Model):
    group_chat = models.ManyToManyField(GroupChat, blank=True)
    messages = models.ManyToManyField(ChatMessage)
    chat_with = models.ForeignKey('Profile', on_delete=models.CASCADE, null=True, blank=True, related_name='chat_with')
    unread = models.IntegerField(default=1)
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        chat_with = self.chat_with.name
        return f'chat with > {chat_with}'
    
    class Meta:
        verbose_name_plural = 'Inboxes'