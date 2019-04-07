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
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    designation = serializers.CharField(read_only=True)
    point = serializers.IntegerField(read_only=True)
    profile_image = serializers.ImageField(read_only=True)

class AllPointsSerializer(serializers.Serializer):
    personal = serializers.IntegerField(read_only=True)
    group = serializers.IntegerField(read_only=True)
    agency = serializers.IntegerField(read_only=True)

# Point summary
class TotalSummarySerializer(serializers.Serializer):
    current = serializers.IntegerField()
    difference = serializers.IntegerField()
    diff_percentage = serializers.FloatField()

class ContactListSerializer(serializers.Serializer):
    referrals = serializers.IntegerField()
    ftf = serializers.IntegerField()
    booth = serializers.IntegerField()
    socmed = serializers.IntegerField()
    nesting = serializers.IntegerField()
    other = serializers.IntegerField()
    ttt = serializers.IntegerField()
    client = serializers.IntegerField()

class ContactSummarySerializer(serializers.Serializer):
    ftf = serializers.IntegerField()
    referrals = serializers.IntegerField()
    new_contacts = serializers.IntegerField()
    new_contacts_percentage = serializers.FloatField()
    client_conversion = serializers.IntegerField()
    client_conversion_percentage = serializers.FloatField()
    contacts = ContactListSerializer()

class EngagementSummarySerializer(serializers.Serializer):
    calls = serializers.IntegerField()
    servicing = serializers.IntegerField()
    appointment = serializers.IntegerField()
    new_calls = serializers.IntegerField()
    new_calls_percentage = serializers.IntegerField()
    new_servicing = serializers.IntegerField()
    new_servicing_percentage = serializers.FloatField()
    new_appointment = serializers.IntegerField()
    new_appointment_percentage = serializers.FloatField()

class SalesSummarySerializer(serializers.Serializer):
    sales_presentation = serializers.IntegerField()
    case_closed = serializers.IntegerField()
    new_sales_presentation = serializers.IntegerField()
    new_sales_presentation_percentage = serializers.FloatField()
    new_cases = serializers.IntegerField()
    new_cases_percentage = serializers.FloatField()
    total_new_sales = serializers.DecimalField(decimal_places=2, max_digits=10)

class RecruitmentSummarySerializer(serializers.Serializer):
    career_presentation = serializers.IntegerField()
    recruitment = serializers.IntegerField()
    new_career_presentation = serializers.IntegerField()
    new_career_presentation_percentage = serializers.FloatField()
    new_recruitment = serializers.IntegerField()
    new_recruitment_percentage = serializers.FloatField()

class CareerSummarySerializer(serializers.Serializer):
    millionaire_suit = serializers.IntegerField()
    update_upline = serializers.IntegerField()
    personal_coaching = serializers.IntegerField()
    training = serializers.IntegerField()

class ConsultantPerfRange(serializers.Serializer):
    _0_20 = serializers.IntegerField()
    _21_40 = serializers.IntegerField()
    _41_60 = serializers.IntegerField()
    _61_80 = serializers.IntegerField()
    _81_100 = serializers.IntegerField()
    _100 = serializers.IntegerField()

class SummarySerializer(serializers.Serializer):
    total = TotalSummarySerializer(read_only=True)
    contacts = ContactSummarySerializer(read_only=True)
    engagement = EngagementSummarySerializer(read_only=True)
    sales = SalesSummarySerializer(read_only=True)
    recruitment = RecruitmentSummarySerializer(read_only=True)
    career = CareerSummarySerializer(read_only=True)
    consultant_perf_range = ConsultantPerfRange(read_only=True)
