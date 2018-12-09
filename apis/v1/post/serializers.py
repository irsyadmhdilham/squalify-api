from rest_framework import serializers
from .. ._models.post import Post, Comment, Like
from .. ._models.profile import Profile

from ..sales.serializers import SalesSerializer
from ..contact.serializers import ContactSerializer

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class LikerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk',)

class LikeSerializer(serializers.ModelSerializer):
    liker = LikerSerializer(read_only=True)

    class Meta:
        model = Like
        fields = ('pk', 'liker',)

class CommentSerializer(serializers.ModelSerializer):
    commented_by = ProfileSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ('pk', 'commented_by', 'text', 'timestamp',)

class PostSerializer(serializers.ModelSerializer):
    posted_by = ProfileSerializer(read_only=True)
    post_type = serializers.StringRelatedField(read_only=True)
    sales_rel = SalesSerializer(read_only=True, many=True)
    users_tagged = ProfileSerializer(read_only=True)
    contact_rel = ContactSerializer(read_only=True)
    likes = serializers.SerializerMethodField()
    comments = serializers.SerializerMethodField()

    class Meta:
        model = Post
        fields = (
            'pk',
            'timestamp',
            'posted_by',
            'post_type',
            'sales_rel',
            'users_tagged',
            'contact_rel',
            'likes',
            'comments',
        )
    
    def get_likes(self, obj):
        likes = obj.likes.values('pk', 'liker')
        return likes

    def get_comments(self, obj):
        comments = obj.comments.all()
        return comments.count()