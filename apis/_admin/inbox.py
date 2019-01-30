from django.contrib import admin
from .._models.inbox import Inbox, GroupChat, ChatMessage

admin.site.register(Inbox)
admin.site.register(GroupChat)
admin.site.register(ChatMessage)