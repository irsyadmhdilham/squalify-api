from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from .. ._models.profile import Profile
from .. ._models.agency import Agency
from .. ._models.group import Group

class AgencySerializer(serializers.ModelSerializer):
    company = serializers.StringRelatedField(read_only=True)
    members = serializers.PrimaryKeyRelatedField(read_only=True, many=True)

    class Meta:
        model = Agency
        fields = ('pk', 'name', 'agency_image', 'company', 'members',)

class UplineSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    members = serializers.PrimaryKeyRelatedField(read_only=True, many=True)

class GroupSerializer(serializers.ModelSerializer):
    members = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    class Meta:
        model = Group
        fields = ('pk', 'members',)

class ProfileSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)
    agency = AgencySerializer(read_only=True)
    group = GroupSerializer(read_only=True)
    upline = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = Profile
        fields = (
            'pk',
            'name',
            'profile_image',
            'designation',
            'settings',
            'agency',
            'group',
            'upline'
        )
    
    def get_upline(self, obj):
        upline = obj.upline
        if upline is None:
            return None
        data = {
            'pk': upline.pk,
            'name': upline.name,
            'members': upline.group.members.all()
        }
        serializer = UplineSerializer(data)
        return serializer.data

class ProfileImageSerializer(serializers.Serializer):
    profile_image = serializers.ImageField()