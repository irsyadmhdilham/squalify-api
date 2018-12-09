from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from .. ._models.agency import Agency
from .. ._models.profile import Profile
from ..post.serializers import PostSerializer
from datetime import date
from django.db.models import Q, Sum

class ProfileSerializer(serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image', 'designation',)

class AgencySerializer(QueryFieldsMixin, serializers.ModelSerializer):
    members = ProfileSerializer(many=True, read_only=True)
    industry = serializers.StringRelatedField(read_only=True)
    owner = serializers.StringRelatedField(read_only=True)
    company = serializers.StringRelatedField(read_only=True)
    posts = serializers.SerializerMethodField()
    points = serializers.SerializerMethodField()

    class Meta:
        model = Agency
        fields = ('pk', 'name', 'owner', 'industry', 'company', 'agency_image', 'members', 'points', 'posts',)

    def get_posts(self, obj):
        posts = obj.posts.order_by('-timestamp')
        request = self.context.get('request')
        serializer = PostSerializer(posts, many=True, context={'request': request})
        return serializer.data
    
    def get_points(self, obj):
        user_pk = self.context.get('request').query_params.get('u')
        if user_pk is None:
            return 0

        profile = Profile.objects.get(pk=user_pk)

        """sum agency today point"""
        agency = obj.members.filter(points__date=date.today()).aggregate(point=Sum('points__attributes__point'))
        if agency['point'] is None:
            agency = {'point': 0}

        """sum group today point"""
        group = 0
        if profile.group is not None:
            group = profile.group.members.filter(points__date=date.today()).aggregate(point=Sum('points__attributes__point'))
            if group['point'] is None:
                group = {'point': 0}
        
        """sum user today point"""
        personal = profile.points.filter(date=date.today()).aggregate(point=Sum('attributes__point'))
        if personal['point'] is None:
            personal = {'point': 0}

        return {
            'agency': agency['point'],
            'group': group['point'],
            'personal': personal['point']
        }