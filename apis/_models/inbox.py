from django.db import models

class ChatType(models.Model):
    name = models.CharField(max_length=150, unique=True)

    def __str__(self):
        return self.name

class ChatMessage(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    person = models.ForeignKey('Profile', on_delete=models.CASCADE)
    text = models.TextField()

    def __str__(self):
        person = self.person.name
        timestamp = str(self.timestamp)
        return f'{timestamp} > {person}'

class Chat(models.Model):
    messages = models.ManyToManyField(ChatMessage)
    composed_by = models.ForeignKey('Profile', on_delete=models.CASCADE, blank=True, null=True)
    participants = models.ManyToManyField('Profile', related_name='chats', blank=True)
    group_name = models.CharField(max_length=200, null=True, blank=True)

    def __str__(self):
        person = self.composed_by.name
        return '{}'.format(person)

class Inbox(models.Model):
    chat = models.ForeignKey(Chat, on_delete=models.CASCADE)
    chat_type = models.ForeignKey(ChatType, on_delete=models.CASCADE, to_field='name', default='Personal')
    chat_with = models.ForeignKey('Profile', on_delete=models.CASCADE, null=True, blank=True, related_name='chat_with')
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        name = self.chat.composed_by.name
        return name
    
    class Meta:
        verbose_name_plural = 'Inboxes'