from rest_framework import serializers
from apis._models.group import Group
from apis._models.profile import Profile

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Profile
        fields = ('url', 'id', 'name', 'profile_image',)

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    owner = serializers.StringRelatedField()
    industry = serializers.CharField(max_length=30)
    company = serializers.CharField(max_length=30)
    members = ProfileSerializer(many=True, read_only=True)

    class Meta:
        model = Group
        fields = ('url', 'owner', 'members', 'industry', 'company',)