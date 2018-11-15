from rest_framework import serializers
from apis._models.group import Group
from apis._models.profile import Profile

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class GroupSerializer(serializers.ModelSerializer):
    owner = serializers.StringRelatedField()
    industry = serializers.CharField(max_length=30)
    company = serializers.CharField(max_length=30)
    members = ProfileSerializer(many=True, read_only=True)

    class Meta:
        model = Group
        fields = ('pk','owner', 'members', 'industry', 'company',)