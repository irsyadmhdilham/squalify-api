from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from .. ._models.profile import Profile
from .. ._models.agency import Agency

class AgencySerializer(serializers.ModelSerializer):
    company = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Agency
        fields = ('pk', 'name', 'agency_image', 'company',)

class ProfileSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)
    agency = AgencySerializer(read_only=True)
    upline = serializers.SerializerMethodField(read_only=True)
    upline_group = serializers.SerializerMethodField(read_only=True)
    group = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Profile
        fields = (
            'pk',
            'name',
            'profile_image',
            'designation',
            'settings',
            'group',
            'agency',
            'upline',
            'upline_group',
        )
    
    def get_group(self, obj):
        if obj.group is not None:
            return obj.group.members.count()
        return obj.group
    
    def get_upline(self, obj):
        if obj.upline is not None:
            return obj.upline.name
        return obj.upline
    
    def get_upline_group(self, obj):
        if obj.upline is not None:
            return obj.upline.group.pk
        return obj.upline