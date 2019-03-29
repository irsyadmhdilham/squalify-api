from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from .. ._models.schedule import Schedule
from .. ._models.contact import Contact
from .. ._models.profile import Profile

class ContactSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = ('pk', 'name', 'contact_no',)

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('pk', 'name',)

class SchedulesSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    contact = ContactSerializer(read_only=True)
    created_by = ProfileSerializer(read_only=True)

    class Meta:
        model = Schedule
        fields = ('pk', 'date', 'title', 'location', 'remark', 'reminder', 'contact', 'created_by',)