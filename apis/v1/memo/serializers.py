from rest_framework import serializers
from .. ._models.memo import Memo
from .. ._models.profile import Profile

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('profile_image', 'name',)

class MemoSerializer(serializers.ModelSerializer):
    posted_by = ProfileSerializer(read_only=True)

    class Meta:
        model = Memo
        fields = ('pk', 'posted_by', 'posted_date', 'start_date', 'end_date', 'countdown', 'text',)