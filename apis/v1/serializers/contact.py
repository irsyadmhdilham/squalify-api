from rest_framework import serializers
from apis._models.contact import Contact
from .schedule import ScheduleSerializer

class ContactSerializer(serializers.HyperlinkedModelSerializer):
    schedule = ScheduleSerializer(allow_null=True, many=True)
    contact_type = serializers.CharField(max_length=30)

    class Meta:
        model = Contact
        fields = ('url', 'name', 'status', 'contact_type', 'remark', 'contact_no', 'schedule', 'image',)