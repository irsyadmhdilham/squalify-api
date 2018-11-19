from rest_framework import serializers
from apis._models.contact import Contact
from apis._models.schedule import Schedule

class ScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schedule
        fields = ('pk', 'date',)

class ContactSerializer(serializers.ModelSerializer):
    contact_type = serializers.StringRelatedField(read_only=True)
    status = serializers.StringRelatedField(read_only=True)
    schedule = ScheduleSerializer(many=True, read_only=True)

    class Meta:
        model = Contact
        fields = ('pk', 'name', 'contact_type', 'status', 'contact_no', 'schedule', 'remark',)