from rest_framework import serializers
from apis._models.group import Group
from apis._models.profile import Profile

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class GroupSerializer(serializers.ModelSerializer):
    owner = serializers.StringRelatedField(read_only=True)
    members = ProfileSerializer(many=True, read_only=True)

    class Meta:
        model = Group
        fields = ('pk','owner', 'members',)