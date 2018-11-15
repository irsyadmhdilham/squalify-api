from rest_framework import serializers
from apis._models.sales import Sales

class SalesSerializer(serializers.ModelSerializer):
    sales_type = serializers.StringRelatedField(read_only=True)
    surcharge = serializers.StringRelatedField(read_only=True)
    sales_status = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Sales
        fields = ('timestamp', 'amount', 'commission', 'sales_type', 'surcharge', 'sales_status', 'document_id')