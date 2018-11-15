from rest_framework import serializers
from apis._models.point import Point

class PointSerializer(serializers.ModelSerializer):
    class Meta:
        model = Point
        fields = (
            'millionnaire_suit',
            'calls_emails_socmed',
            'appointment_secured',
            'referrals',
            'sales_presentation',
            'ftf_booth_nesting',
            'case_closed',
            'career_presentation',
            'sign_up_contract',
            'personal_coaching',
            'joining_field_work',
            'servicing_follow_up',
            'update_upline',
            'agency_program',
            'date',
        )