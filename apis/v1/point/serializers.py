from rest_framework import serializers
from .. ._models.point import Point, PointAttribute
from django.db.models import Sum
from django.utils import timezone
from drf_queryfields import QueryFieldsMixin
from .. ._models.profile import Profile

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
    point_logs = serializers.SerializerMethodField()

    class Meta:
        model = Point
        fields = ('pk', 'attributes', 'logs', 'date', 'productive_point', 'career_point', 'total', 'point_logs',)
    
    def get_productive_point(self, obj):
        production = ('FTF/Nesting/Booth', 'Joining field work', 'Referrals', 'Calls/Email/Socmed', 'Appointment secured', 'Sales presentation', 'Career presentation', 'Case closed', 'Sign up contract')
        joined = '|'.join(production)
        attr = obj.attributes.filter(attribute__name__regex=r'{}'.format(joined))
        point = attr.aggregate(total=Sum('point'))
        if point['total'] is None:
            return 0
        return point['total']
    
    def get_career_point(self, obj):
        career = ('Millionnaire suit', 'Update upline', 'Servicing/Follow up', 'Personal coaching', 'Be early training', 'Agency program')
        joined = '|'.join(career)
        attr = obj.attributes.filter(attribute__name__regex=r'{}'.format(joined))
        point = attr.aggregate(total=Sum('point'))
        if point['total'] is None:
            return 0
        return point['total']
    
    def get_total(self, obj):
        point = obj.attributes.aggregate(total=Sum('point'))
        return point['total']
    
    def get_point_logs(self, obj):
        if 'logs' in obj.logs:
            return obj.logs['logs']
        return []

class ScoreboardSerializer(serializers.Serializer):
    name = serializers.CharField(read_only=True)
    designation = serializers.CharField(read_only=True)
    point = serializers.IntegerField(read_only=True)
    profile_image = serializers.ImageField(read_only=True)