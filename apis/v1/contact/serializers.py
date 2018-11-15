from rest_framework import serializers
from apis._models.contact import Contact
from apis._models.profile import Profile

class ContactsSerializer(serializers.HyperlinkedModelSerializer):
    contact_type = serializers.StringRelatedField(read_only=True)
    status = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = Contact
        fields = ('url', 'name', 'contact_type', 'status', 'contact_no',)

class ProfileContacts(serializers.ModelSerializer):
    contacts = ContactsSerializer(read_only=True, many=True)

    class Meta:
        model = Profile
        fields = ('contacts',)