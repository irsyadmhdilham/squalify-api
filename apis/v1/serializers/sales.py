from rest_framework import serializers
from apis._models.sales import Sales
from contact import ContactSerializer

class SalesSerializer(serializers.HyperlinkedModelSerializer):
    sales_type = serializers.CharField(max_length=30)
    surcharge = serializers.FloatField(default=0.0)
    contact = ContactSerializer()

    class Meta:
        model = Sales
        fields = ('url', 'timestamp', 'location', 'amount','commission', 'sales_type', 'surcharge', 'contact', 'sales_status', 'document_id')