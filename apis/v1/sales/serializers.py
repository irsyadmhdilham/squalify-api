from rest_framework import serializers
from .. ._models.sales import Sales

class SalesSerializer(serializers.ModelSerializer):
    sales_type = serializers.StringRelatedField(read_only=True)
    surcharge = serializers.StringRelatedField(read_only=True)
    sales_status = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Sales
        fields = (
            'pk',
            'timestamp',
            'amount',
            'commission',
            'sales_type',
            'surcharge',
            'sales_status',
            'location',
            'repeat_sales',
            'commission',
        )

class SalesIncomeSerializer(serializers.Serializer):
    sales = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    income = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)

class SummarySerializer(serializers.Serializer):
    year = SalesIncomeSerializer(read_only=True)
    month = SalesIncomeSerializer(read_only=True)
    week = SalesIncomeSerializer(read_only=True)
    today = SalesIncomeSerializer(read_only=True)