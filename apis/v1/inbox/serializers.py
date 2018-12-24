from rest_framework import serializers
from .. ._models.inbox import Inbox, GroupChat, ChatMessage
from .. ._models.profile import Profile

class ProfileSerializer(serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image', 'designation',)

class ChatMessageSerializer(serializers.ModelSerializer):
    person = ProfileSerializer(read_only=True)

    class Meta:
        model = ChatMessage
        fields = ('timestamp', 'person', 'text',)

class GroupChatSerializer(serializers.ModelSerializer):
    owner = ProfileSerializer(read_only=True)
    participants = ProfileSerializer(many=True, read_only=True)
    messages = ChatMessageSerializer(many=True, read_only=True)
    role = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = GroupChat
        fields = ('pk', 'messages', 'owner', 'participants', 'role',)

class InboxSerializer(serializers.ModelSerializer):
    chat_with = ProfileSerializer(read_only=True)
    messages = ChatMessageSerializer(many=True, read_only=True)
    group_chat = GroupChatSerializer(many=True, read_only=True)

    class Meta:
        model = Inbox
        fields = ('pk', 'chat_with', 'group_chat', 'unread', 'messages',)