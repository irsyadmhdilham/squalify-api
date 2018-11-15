from rest_framework import serializers
from apis._models.agency import Agency
from apis._models.profile import Profile
from .post import PostSerializer

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class AgencySerializer(serializers.ModelSerializer):
    members = ProfileSerializer(many=True, read_only=True)
    industry = serializers.CharField(max_length=30)
    owner = serializers.StringRelatedField()
    company = serializers.CharField(max_length=30)
    posts = PostSerializer(many=True)

    class Meta:
        model = Agency
        fields = ('pk', 'name', 'owner', 'industry', 'company', 'agency_image', 'members', 'posts',)