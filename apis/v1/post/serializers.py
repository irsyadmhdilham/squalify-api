from rest_framework import serializers
from apis._models.post import Post, Comment, Applause
from apis._models.profile import Profile

from .sales import SalesSerializer
from .contact import ContactSerializer

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Profile
        fields = ('url', 'id', 'name', 'profile_image',)

class ApplauseSerializer(serializers.HyperlinkedModelSerializer):
    applausers = ProfileSerializer(many=True, read_only=True)

    class Meta:
        model = Applause
        fields = ('applausers',)

class CommentSerializer(serializers.HyperlinkedModelSerializer):
    commented_by = ProfileSerializer(read_only=True)
    text = serializers.CharField(max_length=1000)

    class Meta:
        model = Comment
        fields = ('commented_by', 'text', 'timestamp')

class PostSerializer(serializers.HyperlinkedModelSerializer):
    posted_by = ProfileSerializer(read_only=True)
    post_type = serializers.CharField(max_length=30)
    sales_relation = SalesSerializer()
    users_tagged = ProfileSerializer(read_only=True)
    contact_relation = ContactSerializer(read_only=True)
    applause = ApplauseSerializer(many=True)
    comments = CommentSerializer(many=True)

    class Meta:
        model = Post
        fields = (
            'url',
            'id',
            'posted_by',
            'post_type',
            'sales_relation',
            'users_tagged',
            'referral_tagged',
            'timestamp',
            'comments',
            'applause',
        )