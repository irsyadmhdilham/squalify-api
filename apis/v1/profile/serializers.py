from rest_framework import serializers
from apis._models.profile import Profile
from apis._models.agency import Agency
from apis._models.group import Group

from .contact import ContactSerializer
from .schedule import ScheduleSerializer
from .point import PointSerializer
from .inbox import InboxSerializer
from .notification import NotificationSerializer
from .sales import SalesSerializer

class MemberSerializer(serializers.ModelSerializer):

    class Meta:
        model = Profile
        fields = ('url',)

class AgencySerializer(serializers.HyperlinkedModelSerializer):
    company = serializers.StringRelatedField(read_only=True)
    industry = serializers.StringRelatedField(read_only=True)
    members = MemberSerializer(many=True)

    class Meta:
        model = Agency
        fields = ('pk', 'name', 'agency_image', 'company', 'industry', 'members',)

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('pk')

class uplineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image',)

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    designation = serializers.StringRelatedField()
    contacts = ContactSerializer(many=True, allow_null=True, read_only=True)
    schedules = ScheduleSerializer(many=True, allow_null=True, read_only=True)
    points = PointSerializer(many=True, allow_null=True, read_only=True)
    group = serializers.PrimaryKeyRelatedField(read_only=True)
    agency = AgencySerializer()
    notifications = NotificationSerializer(many=True, allow_null=True, read_only=True)
    inbox = InboxSerializer(many=True, allow_null=True, read_only=True)
    upline = uplineSerializer(allow_null=True)
    sales = SalesSerializer(many=True, allow_null=True, read_only=True)

    class Meta:
        model = Profile
        fields = (
            'pk',
            'name',
            'profile_image',
            'designation',
            'contacts',
            'schedules',
            'points',
            'group',
            'sales',
            'agency', 
            'notifications',
            'upline',
            'inbox',
            'settings',
        )