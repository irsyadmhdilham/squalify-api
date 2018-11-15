from rest_framework import serializers
from apis._models.profile import Profile

class ProfileSerializer(serializers.ModelSerializer):
    designation = serializers.StringRelatedField(read_only=True)
    contacts = serializers.HyperlinkedRelatedField(view_name='contact-detail', read_only=True, many=True)

    class Meta:
        model = Profile
        fields = (
            'pk',
            'name',
            'profile_image',
            'designation',
            'contacts',
        )