from rest_framework import serializers
from .. ._models.inbox import Inbox, GroupChat, ChatMessage
from .. ._models.profile import Profile
from .. ._models.agency import Agency

class ProfileSerializer(serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image', 'designation',)

class AgencySerializer(serializers.ModelSerializer):
    class Meta:
        model = Agency
        fields = ('agency_image', 'name',)

class CreatedBySerializer(serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)
    agency = AgencySerializer(read_only=True)

    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image', 'designation', 'agency',)

class ChatMessageSerializer(serializers.ModelSerializer):
    person = ProfileSerializer(read_only=True)

    class Meta:
        model = ChatMessage
        fields = ('timestamp', 'person', 'text',)

class GroupChatSerializer(serializers.ModelSerializer):
    created_by = CreatedBySerializer(read_only=True)
    participants = ProfileSerializer(many=True, read_only=True)
    messages = ChatMessageSerializer(many=True, read_only=True)

    class Meta:
        model = GroupChat
        fields = ('pk', 'messages', 'created_by', 'participants', 'title', 'group_image',)

class InboxSerializer(serializers.ModelSerializer):
    chat_with = ProfileSerializer(read_only=True)
    messages = ChatMessageSerializer(many=True, read_only=True)
    group_chat = GroupChatSerializer(read_only=True)

    class Meta:
        model = Inbox
        fields = ('pk', 'chat_with', 'group_chat', 'unread', 'messages',)

class GroupImageSerializer(serializers.Serializer):
    pk = serializers.IntegerField()
    group_image = serializers.ImageField()