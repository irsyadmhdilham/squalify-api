from django.contrib import admin
from .._models.inbox import Inbox, GroupChat, ChatMessage, GroupChatRole

admin.site.register(Inbox)
admin.site.register(GroupChat)
admin.site.register(ChatMessage)
admin.site.register(GroupChatRole)