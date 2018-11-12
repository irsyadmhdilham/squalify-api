from rest_framework import serializers
from apis._models.inbox import Inbox, Conversation
from apis._models.profile import Profile

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    class meta:
        model = Profile
        fields = ('url', 'id', 'name', 'profile_image',)

class ConversationSerializer(serializers.HyperlinkedModelSerializer):
    subscriber = ProfileSerializer(many=True)

    class Meta:
        model = Conversation
        fields = ('url', 'subscriber', 'conversation',)

class InboxSerializer(serializers.HyperlinkedModelSerializer):
    conversation = ConversationSerializer(many=False)

    class Meta:
        model = Inbox
        fields = ('url', 'sender', 'conversation',)