from rest_framework import serializers
from apis._models.profile import Profile
from apis._models.agency import Agency

class AgencySerializer(serializers.ModelSerializer):
    class Meta:
        model = Agency
        fields = ('pk', 'name', 'agency_image',)

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)
    agency = AgencySerializer(read_only=True)
    upline = serializers.StringRelatedField(read_only=True)
    group = serializers.PrimaryKeyRelatedField(read_only=True)

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
        )