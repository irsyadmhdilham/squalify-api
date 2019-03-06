from rest_framework import serializers
from .. ._models.sales import Sales

class SalesSerializer(serializers.ModelSerializer):
    sales_type = serializers.StringRelatedField(read_only=True)
    sales_status = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Sales
        fields = (
            'pk',
            'timestamp',
            'amount',
            'commission',
            'sales_type',
            'sales_status',
            'location',
            'commission',
        )

class Status(serializers.Serializer):
    in_hand = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    submitted = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    rejected = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    disburst = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)

class SummarySerializer(serializers.Serializer):
    today = Status(read_only=True)
    week = Status(read_only=True)
    month = Status(read_only=True)
    year = Status(read_only=True)