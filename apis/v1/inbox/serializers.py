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

class OwnerSerializer(serializers.ModelSerializer):
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
    owner = OwnerSerializer(read_only=True)
    participants = ProfileSerializer(many=True, read_only=True)
    messages = ChatMessageSerializer(many=True, read_only=True)
    role = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = GroupChat
        fields = ('pk', 'messages', 'owner', 'participants', 'role',)
    
    def get_role(self, obj):
        kwargs = self.context.get('request').parser_context.get('kwargs')
        user_pk = kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        upline = profile.upline
        if obj.role.name == 'group' and upline == obj.owner:
            return 'upline group'
        elif obj.role.name == 'group' and profile == obj.owner:
            return 'group'
        else:
            return 'agency'

class InboxSerializer(serializers.ModelSerializer):
    chat_with = ProfileSerializer(read_only=True)
    messages = ChatMessageSerializer(many=True, read_only=True)
    group_chat = GroupChatSerializer(many=True, read_only=True)

    class Meta:
        model = Inbox
        fields = ('pk', 'chat_with', 'group_chat', 'unread', 'messages',)