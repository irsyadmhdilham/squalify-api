from rest_framework import serializers
from apis._models.profile import Profile, Designation
from apis._models.agency import Agency
from apis._models.group import Group

from .contact import ContactSerializer
from .schedule import ScheduleSerializer
from .point import PointSerializer
from .inbox import InboxSerializer
from .notification import NotificationSerializer
from .sales import SalesSerializer

class AgencySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Agency
        fields = ('url','id', 'name', 'agency_image', 'company', 'industry',)

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'id',)

class uplineSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Profile
        fields = ('url', 'id', 'name', 'profile_image',)

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    designation = serializers.StringRelatedField()
    user = serializers.StringRelatedField()
    contacts = ContactSerializer(many=True, allow_null=True)
    schedules = ScheduleSerializer(many=True, allow_null=True)
    points = PointSerializer(many=True, allow_null=True)
    group = GroupSerializer(allow_null=True)
    agency = AgencySerializer(read_only=True)
    notifications = NotificationSerializer(many=True, allow_null=True)
    inbox = InboxSerializer(many=True, allow_null=True)
    upline = uplineSerializer(read_only=True)
    sales = SalesSerializer(many=True, allow_null=True)

    class Meta:
        model = Profile
        fields = (
            'url',
            'name',
            'profile_image',
            'user',
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