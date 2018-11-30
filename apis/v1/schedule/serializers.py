from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from apis._models.schedule import Schedule
from apis._models.contact import Contact

class ContactSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = ('pk', 'name', 'contact_no',)

class SchedulesSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    contact = ContactSerializer(read_only=True)

    class Meta:
        model = Schedule
        fields = ('pk', 'date', 'title', 'location', 'remark', 'reminder', 'contact',)