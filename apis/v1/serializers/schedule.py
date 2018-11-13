from rest_framework import serializers
from apis._models.schedule import Schedule
from apis._models.contact import Contact

class ContactSerializer(serializers.HyperlinkedModelSerializer):
    contact_type = serializers.CharField(max_length=30)

    class Meta:
        model = Contact
        fields = ('url', 'name', 'status', 'contact_type', 'remark', 'contact_no', 'image',)

class ScheduleSerializer(serializers.HyperlinkedModelSerializer):
    contact = ContactSerializer(allow_null=True)

    class Meta:
        model = Schedule
        fields = ('url', 'date', 'title', 'remark', 'location', 'contact',)