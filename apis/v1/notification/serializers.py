from rest_framework import serializers
from .. ._models.notification import Notification
from .. ._models.profile import Profile
from .. ._models.inbox import Inbox, GroupChat

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class GroupChatSerializer(serializers.ModelSerializer):
    role = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = GroupChat
        fields = ('pk', 'role',)
    
    def get_role(self, obj):
        kwargs = self.context.get('request').parser_context.get('kwargs')
        pk = kwargs.get('user_pk')
        profile = Profile.objects.get(pk=pk)
        upline = profile.upline
        role = obj.role.name
        if upline and role == 'group':
            return 'upline group'
        elif role == 'group':
            return 'group'
        else:
            return 'agency'

class InboxSerializer(serializers.ModelSerializer):
    group_chat = GroupChatSerializer(read_only=True)

    class Meta:
        model = Inbox
        fields = ('pk', 'unread', 'group_chat',)

class NotificationSerializer(serializers.ModelSerializer):
    notified_by = ProfileSerializer(read_only=True)
    notification_type = serializers.StringRelatedField(read_only=True)
    post_rel = serializers.PrimaryKeyRelatedField(read_only=True)
    inbox_rel = InboxSerializer(read_only=True)

    class Meta:
        model = Notification
        fields = ('pk', 'notified_by', 'notification_type', 'timestamp', 'post_rel', 'inbox_rel', 'read',)