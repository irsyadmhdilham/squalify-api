from rest_framework import serializers
from apis._models.schedule import Schedule

class SchedulesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schedule
        fields = ('pk', 'date', 'title', 'location', 'remark', 'reminder',)