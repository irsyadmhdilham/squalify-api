from rest_framework import generics
from rest_framework.authentication import TokenAuthentication
from .. ._models.profile import Profile
from .. ._models.contact import Contact, ContactType, ContactStatus
from .. ._models.schedule import Schedule
from .serializers import ContactSerializer
import requests
import json

class ContactList(generics.ListCreateAPIView):
    serializer_class = ContactSerializer
    authentication_classes = (TokenAuthentication,)

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).contacts.all().order_by('-created_on')

    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        referrer_pk = self.request.data.get('referrerId')
        contact_type_val = self.request.data.get('contact_type')
        profile = Profile.objects.get(pk=user_pk)
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
        new_contact = serializer.save(contact_type=contact_type)
        if referrer_pk is not None:
            referrer = Contact.objects.get(pk=referrer_pk)
            new_contact = serializer.save(contact_type=contact_type, referrer=referrer)
        profile.contacts.add(new_contact)

class ContactDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer
    authentication_classes = (TokenAuthentication,)

    def perform_update(self, serializer):
        pk = self.kwargs.get('pk')
        contact_type_val = self.request.data.get('contact_type')
        status_val = self.request.data.get('status')
        q = self.request.query_params.get('xtra')

        contact = Contact.objects.get(pk=pk)
        contact_type = ContactType.objects.get(contact_type=contact_type_val)
        status = ContactStatus.objects.get(status=status_val)
        instance = serializer.save(contact_type=contact_type, status=status)
        if q == 'add-schedule':
            schedule_pk = self.request.data.get('scheduleId')
            schedule = Schedule.objects.get(pk=schedule_pk)
            contact.schedules.add(schedule)
            schedule.contact = contact
            schedule.save()


    def perform_destroy(self, instance):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        profile.contacts.remove(instance)
        instance.delete()
