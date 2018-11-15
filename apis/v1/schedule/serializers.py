from rest_framework import serializers
from apis._models.schedule import Schedule

class SchedulesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Schedule
        fields = ('date', 'title', 'location')