from rest_framework import serializers
from apis._models.schedule import Schedule
from .contact import ContactSerializer

class ScheduleSerializer(serializers.HyperlinkedModelSerializer):
    contact = ContactSerializer(allow_null=True)

    class Meta:
        model = Schedule
        fields = ('url', 'date', 'title', 'remark', 'location', 'contact',)