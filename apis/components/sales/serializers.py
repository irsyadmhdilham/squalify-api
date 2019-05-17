from rest_framework import serializers
from .. ._models.sales import Sales
from .. ._models.contact import Contact

class ContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = ('pk', 'name',)

class SalesSerializer(serializers.ModelSerializer):
    sales_type = serializers.StringRelatedField(read_only=True)
    sales_status = serializers.StringRelatedField(read_only=True)
    contact = ContactSerializer(read_only=True)

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
            'contact',
            'client_name',
            'tips',
        )

class OutputSerializer(serializers.Serializer):
    cases = serializers.IntegerField(read_only=True)
    total = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)

class SummarySerializer(serializers.Serializer):
    in_hand = OutputSerializer(read_only=True)
    submitted = OutputSerializer(read_only=True)
    rejected = OutputSerializer(read_only=True)
    disburst = OutputSerializer(read_only=True)

# class SummarySerializer(serializers.Serializer):
#     today = Status(read_only=True)
#     week = Status(read_only=True)
#     month = Status(read_only=True)
#     year = Status(read_only=True)