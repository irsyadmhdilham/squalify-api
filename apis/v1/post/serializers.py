from rest_framework import serializers
from .. ._models.post import Post, Comment, Like, Memo
from .. ._models.profile import Profile
from django.db.models import Sum

from ..sales.serializers import SalesSerializer
from ..contact.serializers import ContactSerializer
from django.utils import timezone

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

class MemoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Memo
        fields = ('pk', 'start_date', 'end_date', 'text', 'countdown',)

class PostSerializer(serializers.ModelSerializer):
    posted_by = ProfileSerializer(read_only=True)
    post_type = serializers.StringRelatedField(read_only=True)
    sales_rel = SalesSerializer(read_only=True, many=True)
    users_tagged = ProfileSerializer(read_only=True)
    contact_rel = ContactSerializer(read_only=True)
    likes = serializers.SerializerMethodField()
    comments = CommentSerializer(read_only=True, many=True)
    monthly_sales = serializers.SerializerMethodField()
    memo = MemoSerializer(read_only=True)

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
            'monthly_sales',
            'memo',
        )
    
    def get_likes(self, obj):
        likes = obj.likes.values('pk', 'liker')
        return likes
    
    def get_monthly_sales(self, obj):
        user_pk = obj.posted_by.pk
        profile = Profile.objects.get(pk=user_pk)
        sales = profile.sales.filter(timestamp__month=timezone.now().date().month)
        sum_up = sales.aggregate(total=Sum('amount'))
        total = 0
        if sum_up['total'] is not None:
            total = sum_up['total']
        return str(round(total, 2))