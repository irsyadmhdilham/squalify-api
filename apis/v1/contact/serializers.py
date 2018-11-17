from rest_framework import serializers
from apis._models.contact import Contact

class ContactSerializer(serializers.ModelSerializer):
    contact_type = serializers.StringRelatedField(read_only=True)
    status = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Contact
        fields = ('pk', 'name', 'contact_type', 'status', 'contact_no',)