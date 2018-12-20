from rest_framework import serializers
from .. ._models.inbox import Inbox, Chat, ChatMessage
from .. ._models.profile import Profile

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image', 'designation',)

class ChatMessageSerializer(serializers.ModelSerializer):
    person = ProfileSerializer(read_only=True)

    class Meta:
        model = ChatMessage
        fields = ('timestamp', 'person', 'text',)

class ChatSerializer(serializers.ModelSerializer):
    composed_by = ProfileSerializer(read_only=True)
    participants = ProfileSerializer(many=True, read_only=True)
    chat_type = serializers.StringRelatedField(read_only=True)
    messages = ChatMessageSerializer(many=True, read_only=True)

    class Meta:
        model = Chat
        fields = ('pk', 'messages', 'composed_by', 'participants', 'group_name', 'chat_type',)

class InboxSerializer(serializers.ModelSerializer):
    chat = ChatSerializer(read_only=True)

    class Meta:
        model = Inbox
        fields = ('pk', 'chat',)