from rest_framework import generics
from apis._models.profile import Profile
from .serializers import ProfileContacts

class ContactList(generics.ListAPIView):
    serializer_class = ProfileContacts

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).contacts

class ContactDetail(generics.RetrieveUpdateDestroyAPIView):
    pass