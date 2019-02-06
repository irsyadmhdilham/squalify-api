from rest_framework import serializers
from drf_queryfields import QueryFieldsMixin
from .. ._models.contact import Contact
from .. ._models.schedule import Schedule
from .. ._models.point import Point
from .. ._models.profile import Profile

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

class CallLogSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    date = serializers.DateTimeField()
    name = serializers.CharField()
    answered = serializers.BooleanField()

    def create(self, validated_data):
        request = self.context.get('request')
        kwargs = request.parser_context.get('kwargs')
        user_pk = kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        if 'logs' in profile.call_logs:
            profile.call_logs['logs'].append(validated_data)
        else:
            profile.call_logs['logs'] = [validated_data]
        profile.save()
        return validated_data