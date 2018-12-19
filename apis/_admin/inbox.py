from django.contrib import admin
from .._models.inbox import Inbox, Chat, ChatMessage, ChatType

admin.site.register(Inbox)
admin.site.register(Chat)
admin.site.register(ChatMessage)
admin.site.register(ChatType)