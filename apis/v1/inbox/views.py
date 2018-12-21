from rest_framework import generics, status
from rest_framework.response import Response
from .serializers import InboxSerializer, ChatMessageSerializer
from .. ._models.profile import Profile
from .. ._models.inbox import ChatMessage, GroupChat, Inbox

class InboxList(generics.ListCreateAPIView):
    serializer_class = InboxSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        return profile.inbox
    
    def create(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
        receiver_pk = request.data.get('receiverId')
        text = request.data.get('text')

        """user profiles"""
        receiver = Profile.objects.get(pk=receiver_pk)
        profile = Profile.objects.get(pk=user_pk)

        """create new message"""
        message = ChatMessage.objects.create(person=profile, text=text)

        """create inbox"""
        instance = Inbox.objects.create(chat_with=receiver, unread=0)
        instance.messages.add(message)
        profile.inbox.add(instance)

        """find receiver inbox to avoid double instance"""
        find_chat = receiver.inbox.filter(chat_with=profile)
        if find_chat.count() > 0:
            chat = find_chat[0]
            chat.messages.add(message)
            chat.unread += 1
            chat.save()
        else:
            create_new = Inbox.objects.create(chat_with=profile)
            create_new.messages.add(message)
        
        serializer = ChatMessageSerializer(message, context={'request': request})
        return Response({
            'inbox': self.serializer_class(instance, context={'request': request}).data,
            'message': serializer.data
        }, status=status.HTTP_200_OK)

class InboxDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = InboxSerializer
    queryset = Inbox.objects.all()

    def update(self, request, *args, **kwargs):
        text = request.data.get('text')
        user_pk = kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        chat = self.get_object()
        
        message = ChatMessage.objects.create(person=profile, text=text)
        chat.messages.add(message)

        serializer = ChatMessageSerializer(message, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)