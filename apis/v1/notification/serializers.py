from rest_framework import serializers
from .. ._models.notification import Notification
from .. ._models.profile import Profile
from .. ._models.inbox import Inbox

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class InboxSerializer(serializers.ModelSerializer):
    class Meta:
        model = Inbox
        fields = ('pk', 'unread',)

class NotificationSerializer(serializers.ModelSerializer):
    notified_by = ProfileSerializer(read_only=True)
    notification_type = serializers.StringRelatedField(read_only=True)
    post_rel = serializers.PrimaryKeyRelatedField(read_only=True)
    inbox_rel = InboxSerializer(read_only=True)

    class Meta:
        model = Notification
        fields = ('pk', 'notified_by', 'notification_type', 'timestamp', 'post_rel', 'inbox_rel', 'read',)