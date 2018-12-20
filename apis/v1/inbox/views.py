from rest_framework import generics, status
from rest_framework.response import Response
from .serializers import InboxSerializer, ChatSerializer, ChatMessageSerializer
from .. ._models.profile import Profile
from .. ._models.inbox import ChatMessage, Chat

class InboxList(generics.ListCreateAPIView):
    serializer_class = InboxSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        return profile.inbox
    
    def perform_create(self, serializer):
        user_pk = self.kwargs.get('user_pk')
        text = self.request.data.get('text')
        receiver_pk = self.request.data.get('receiverId')
        receiver = Profile.objects.get(pk=receiver_pk)
        profile = Profile.objects.get(pk=user_pk)

        message = ChatMessage.objects.create(person=profile, text=text)
        chat = Chat.objects.create(composed_by=profile)
        chat.messages.add(message)
        chat.participants.add(profile, receiver)

        instance = serializer.save(chat=chat)
        profile.inbox.add(instance)
        receiver.inbox.add(instance)


class InboxDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ChatSerializer
    queryset = Chat.objects.all()

    def perform_update(self, serializer):
        obj = self.get_object()
        print(obj)