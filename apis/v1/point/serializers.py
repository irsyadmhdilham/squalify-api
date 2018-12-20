from rest_framework import serializers
from .. ._models.point import Point, PointAttribute, PointLog
from django.db.models import Sum
from django.utils import timezone
from drf_queryfields import QueryFieldsMixin
from .. ._models.profile import Profile

class PointLogSerializer(serializers.ModelSerializer):
    point_type = serializers.StringRelatedField(read_only=True)
    attribute = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = PointLog
        fields = ('pk', 'timestamp', 'point_type', 'attribute', 'point',)

class PointAttributeSerializer(serializers.ModelSerializer):
    attribute = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = PointAttribute
        fields = ('pk', 'attribute', 'point',)

class PointSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    attributes = PointAttributeSerializer(many=True, read_only=True)
    productive_point = serializers.SerializerMethodField()
    career_point = serializers.SerializerMethodField()
    total = serializers.SerializerMethodField()
    logs = PointLogSerializer(many=True, read_only=True)

    class Meta:
        model = Point
        fields = ('pk', 'attributes', 'logs', 'date', 'total', 'productive_point', 'career_point',)
    
    def get_productive_point(self, obj):
        query_type = self.context.get('request').query_params.get('type')
        if query_type != 'logs':
            production = ('FTF/Nesting/Booth', 'Joining field work', 'Referrals', 'Calls/Email/Socmed', 'Appointment secured', 'Sales presentation', 'Career presentation', 'Case closed', 'Sign up contract')
            joined = '|'.join(production)
            attr = obj.attributes.filter(attribute__name__regex=r'{}'.format(joined))
            point = attr.aggregate(total=Sum('point'))
            if point['total'] is None:
                return 0
            return point['total']
    
    def get_career_point(self, obj):
        query_type = self.context.get('request').query_params.get('type')
        if query_type != 'logs':
            career = ('Millionnaire suit', 'Update upline', 'Servicing/Follow up', 'Personal coaching', 'Be early on training', 'Agency program')
            joined = '|'.join(career)
            attr = obj.attributes.filter(attribute__name__regex=r'{}'.format(joined))
            point = attr.aggregate(total=Sum('point'))
            if point['total'] is None:
                return 0
            return point['total']
    
    def get_total(self, obj):
        query_type = self.context.get('request').query_params.get('type')
        if query_type != 'logs':
            total = obj.attributes.aggregate(total=Sum('point'))['total']
            if total is None:
                return 0
            return total

class ScoreboardSerializer(serializers.Serializer):
    name = serializers.CharField(read_only=True)
    designation = serializers.CharField(read_only=True)
    point = serializers.IntegerField(read_only=True)
    profile_image = serializers.ImageField(read_only=True)