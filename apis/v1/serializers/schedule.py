from rest_framework import serializers
from apis._models.schedule import Schedule

class ScheduleSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Schedule
        fields = ('url', 'date', 'title', 'remark', 'location',)