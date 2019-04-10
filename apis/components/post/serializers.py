from rest_framework import serializers
from .. ._models.post import Post, Comment, Like
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

class PostSerializer(serializers.ModelSerializer):
    posted_by = ProfileSerializer(read_only=True)
    post_type = serializers.StringRelatedField(read_only=True)
    sales_rel = SalesSerializer(read_only=True, many=True)
    users_tagged = ProfileSerializer(read_only=True)
    contact_rel = ContactSerializer(read_only=True)
    likes = serializers.SerializerMethodField()
    comments = CommentSerializer(read_only=True, many=True)
    monthly_sales = serializers.SerializerMethodField(read_only=True)
    tips = serializers.SerializerMethodField(read_only=True)
    sales = serializers.SerializerMethodField(read_only=True)

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
            'tips',
            'sales',
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
    
    def get_tips(self, obj):
        sales = obj.sales_rel
        if sales.count() > 0:
            tips = sales.latest('timestamp').tips
            return tips
        return None
    
    def get_sales(self, obj):
        sales = obj.sales_rel
        epf = sales.filter(sales_type__name='EPF').aggregate(total=Sum('amount'))['total']
        cash = sales.filter(sales_type__name='Cash').aggregate(total=Sum('amount'))['total']
        takaful = sales.filter(sales_type__name='Tafakul').aggregate(total=Sum('amount'))['total']
        prs = sales.filter(sales_type__name='PRS').aggregate(total=Sum('amount'))['total']
        asb = sales.filter(sales_type__name='ASB').aggregate(total=Sum('amount'))['total']
        wasiat = sales.filter(sales_type__name='Wasiat').aggregate(total=Sum('amount'))['total']
        all_sales = [
            ('EPF', epf),
            ('Cash', cash),
            ('Takaful', takaful),
            ('PRS', prs),
            ('ASB', asb),
            ('Wasiat', wasiat)
        ]
        output = filter(lambda val: val[1] != None, all_sales)
        return output