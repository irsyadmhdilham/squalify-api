from rest_framework import serializers
from apis._models.profile import Profile

class ProfileSerializer(serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Profile
        fields = ('pk', 'name', 'designation',)