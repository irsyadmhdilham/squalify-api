from rest_framework import serializers
from apis._models.referral import Referral
from .schedule import ScheduleSerializer

class ReferralSerializer(serializers.HyperlinkedModelSerializer):
    schedule = ScheduleSerializer(allow_null=True)

    class Meta:
        model = Referral
        fields = ('url', 'name', 'status', 'remark', 'contact_no', 'schedule',)