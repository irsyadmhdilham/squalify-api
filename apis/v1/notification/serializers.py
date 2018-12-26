from rest_framework import serializers
from .. ._models.notification import Notification
from .. ._models.profile import Profile
from .. ._models.inbox import Inbox, GroupChat

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class InboxSerializer(serializers.ModelSerializer):
    group_chat = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Inbox
        fields = ('pk', 'unread', 'group_chat',)

    def get_group_chat(self, obj):
        group_chat = obj.group_chat.all()
        if group_chat.count() > 0:
            chat = group_chat[0]
            return chat.role.name
        return None

class NotificationSerializer(serializers.ModelSerializer):
    notified_by = ProfileSerializer(read_only=True)
    notification_type = serializers.StringRelatedField(read_only=True)
    post_rel = serializers.PrimaryKeyRelatedField(read_only=True)
    inbox_rel = InboxSerializer(read_only=True)

    class Meta:
        model = Notification
        fields = ('pk', 'notified_by', 'notification_type', 'timestamp', 'post_rel', 'inbox_rel', 'read',)