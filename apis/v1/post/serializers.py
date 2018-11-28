from rest_framework import serializers
from apis._models.post import Post, Comment, Like
from apis._models.profile import Profile

from apis.v1.sales.serializers import SalesSerializer
from apis.v1.contact.serializers import ContactSerializer

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class LikeSerializer(serializers.ModelSerializer):
    likers = ProfileSerializer(many=True, read_only=True)

    class Meta:
        model = Like
        fields = ('likers',)

class CommentSerializer(serializers.ModelSerializer):
    commented_by = ProfileSerializer(read_only=True)
    text = serializers.CharField(max_length=1000)

    class Meta:
        model = Comment
        fields = ('commented_by', 'text', 'timestamp')

class PostSerializer(serializers.ModelSerializer):
    posted_by = ProfileSerializer(read_only=True)
    post_type = serializers.StringRelatedField(read_only=True)
    sales_rel = SalesSerializer(read_only=True)
    users_tagged = ProfileSerializer(read_only=True)
    contact_rel = ContactSerializer(read_only=True)
    likes = LikeSerializer(many=True)
    comments = CommentSerializer(many=True)

    class Meta:
        model = Post
        fields = (
            'pk',
            'posted_by',
            'post_type',
            'sales_rel',
            'users_tagged',
            'contact_rel',
            'timestamp',
            'comments',
            'likes',
        )