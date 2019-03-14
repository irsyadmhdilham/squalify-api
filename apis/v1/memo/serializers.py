from rest_framework import serializers
from .. ._models.memo import Memo
from .. ._models.profile import Profile
from ..post.serializers import CommentSerializer

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'profile_image', 'name',)

class MemoSerializer(serializers.ModelSerializer):
    posted_by = ProfileSerializer(read_only=True)
    likes = serializers.SerializerMethodField()
    comments = CommentSerializer(read_only=True, many=True)

    class Meta:
        model = Memo
        fields = (
            'pk', 
            'posted_by',
            'posted_date',
            'expiry_date',
            'countdown',
            'text',
            'likes',
            'comments',
        )

    def get_likes(self, obj):
        return obj.likes.values('pk', 'liker')