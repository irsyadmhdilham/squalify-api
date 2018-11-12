from rest_framework import serializers
from apis._models.sales import Sales

class SalesSerializer(serializers.HyperlinkedModelSerializer):
    sales_type = serializers.CharField(max_length=30)
    surcharge = serializers.FloatField(default=0.0)

    class Meta:
        model = Sales
        fields = ('url', 'timestamp', 'location', 'amount', 'sales_type', 'surcharge',)