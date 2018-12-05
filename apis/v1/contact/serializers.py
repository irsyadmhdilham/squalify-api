from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from .. ._models.contact import Contact
from .. ._models.schedule import Schedule
from .. ._models.point import Point

class ScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schedule
        fields = ('pk', 'date', 'title',)

class ReferrerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = ('pk', 'name',)

class ContactSerializer(QueryFieldsMixin, serializers.ModelSerializer):
    contact_type = serializers.StringRelatedField(read_only=True)
    status = serializers.StringRelatedField(read_only=True)
    schedules = ScheduleSerializer(many=True, read_only=True)
    referrer = ReferrerSerializer(read_only=True)

    class Meta:
        model = Contact
        fields = (
            'pk',
            'name',
            'contact_type',
            'status',
            'contact_no',
            'remark',
            'referrer',
            'schedules',
        )