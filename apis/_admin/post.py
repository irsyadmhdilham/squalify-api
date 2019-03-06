from django.contrib import admin
from .._models.post import Post, PostType, Comment, Like

admin.site.register(Comment)
admin.site.register(PostType)
admin.site.register(Like)
admin.site.register(Post)