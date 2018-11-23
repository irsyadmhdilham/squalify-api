from rest_framework import generics
from apis._models.profile import Profile
from apis._models.contact import Contact, ContactType, ContactStatus
from .serializers import ContactSerializer

class ContactList(generics.ListCreateAPIView):
    serializer_class = ContactSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).contacts.all().order_by('-created_on')

    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        status_val = self.request.data.get('status')
        contact_type_val = self.request.data.get('contact_type')
        profile = Profile.objects.get(pk=user_pk)
        status = ContactStatus.objects.get(status=status_val)
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
        new_contact = serializer.save(status=status, contact_type=contact_type)
        profile.contacts.add(new_contact)

class ContactDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Contact.objects.all()
    lookup_field = 'pk'
    serializer_class = ContactSerializer

    def perform_update(self, serializer):
        contact_type_val = self.request.data.get('contact_type')
        status_val = self.request.data.get('status')
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
        status = ContactStatus.objects.get(status=status_val)
        instance = serializer.save(contact_type=contact_type, status=status)

    def perform_destroy(self, instance):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        profile.contacts.remove(instance)
        instance.delete()