from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from apis._models.agency import Agency
from apis._models.profile import Profile
from apis.v1.post.serializers import PostSerializer

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class AgencySerializer(QueryFieldsMixin, serializers.ModelSerializer):
    members = ProfileSerializer(many=True, read_only=True)
    industry = serializers.StringRelatedField(read_only=True)
    owner = serializers.StringRelatedField(read_only=True)
    company = serializers.StringRelatedField(read_only=True)
    posts = PostSerializer(many=True)

    class Meta:
        model = Agency
        fields = ('pk', 'name', 'owner', 'industry', 'company', 'agency_image', 'members', 'posts',)