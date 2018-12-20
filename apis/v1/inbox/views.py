from rest_framework import generics
from .serializers import InboxSerializer
from .. ._models.profile import Profile
from .. ._models.inbox import ChatMessage, Chat

class InboxList(generics.ListCreateAPIView):
    serializer_class = InboxSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        return profile.inbox
    
    def perform_create(self, serializer):
        text = self.request.data.get('text')
        person_pk = self.request.data.get('userId')
        person = Profile.objects.get(pk=person_pk)
        message = ChatMessage.objects.create(person=person, text=text)

        chat = Chat.objects.create(composed_by=person)
        chat.messages.add(message)