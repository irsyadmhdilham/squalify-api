from rest_framework import serializers
from apis._models.group import Group
from apis._models.profile import Profile

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    downline = serializers.SerializerMethodField()
    designation = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Profile
        fields = ('pk', 'name', 'profile_image', 'designation', 'downline',)
    
    def get_downline(self, obj):
        if obj.group is None:
            return None
        members = obj.group.members
        return members.count()

class GroupSerializer(serializers.ModelSerializer):
    owner = serializers.SerializerMethodField()
    members = ProfileSerializer(many=True, read_only=True)

    class Meta:
        model = Group
        fields = ('pk','owner', 'members',)
    
    def get_owner(self, obj):
        return obj.owner.name