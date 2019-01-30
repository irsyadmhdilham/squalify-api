from django.db import models

class ChatMessage(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    person = models.ForeignKey('Profile', on_delete=models.CASCADE)
    text = models.TextField()

    def __str__(self):
        person = self.person.name
        timestamp = str(self.timestamp)
        return f'{timestamp} > {person}'

def image_directory_path(instance, filename):
    return f'group_chat/{filename}'

class GroupChat(models.Model):
    title = models.CharField(max_length=200, null=True, blank=True)
    created_by = models.ForeignKey('Profile', on_delete=models.CASCADE, blank=True, null=True)
    participants = models.ManyToManyField('Profile', related_name='chats', blank=True)
    group_image = models.ImageField(upload_to=image_directory_path, default='no_image.jpeg')

    def __str__(self):
        return str(self.title)

class Inbox(models.Model):
    group_chat = models.ForeignKey(GroupChat, blank=True, null=True, on_delete=models.CASCADE)
    messages = models.ManyToManyField(ChatMessage, blank=True)
    chat_with = models.ForeignKey('Profile', on_delete=models.CASCADE, null=True, blank=True, related_name='chat_with')
    unread = models.IntegerField(default=1)
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        group_chat = self.group_chat
        return f'{self.pk}. group ({group_chat.title})' if group_chat is not None else f'{self.pk}. personal (chat with {self.chat_with.name})'
    
    class Meta:
        verbose_name_plural = 'Inboxes'