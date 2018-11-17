from rest_framework import generics
from apis._models.profile import Profile
from apis._models.contact import Contact, ContactType, ContactStatus
from .serializers import ContactSerializer

class ContactList(generics.ListCreateAPIView):
    serializer_class = ContactSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).contacts.all()

    def perform_create(self, serializer):
        user_pk = self.request.data.get('user_pk')
        status_val = self.request.data.get('status')
        contact_type_val = self.request.data.get('contact_type')
        user = Profile.objects.get(pk=user_pk)
        status = ContactStatus.objects.get(status=status_val)
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
        new_contact = serializer.save(status=status, contact_type=contact_type)
        user.contacts.add(new_contact)


class CreateContact(generics.CreateAPIView):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer

    def perform_create(self, serializer):
        user_pk = self.request.data.get('user_pk')
        status_val = self.request.data.get('status')
        contact_type_val = self.request.data.get('contact_type')
        user = Profile.objects.get(pk=user_pk)
        status = ContactStatus.objects.get(status=status_val)
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
        new_contact = serializer.save(status=status, contact_type=contact_type)
        user.contacts.add(new_contact)