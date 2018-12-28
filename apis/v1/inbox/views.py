from rest_framework import generics, status
from rest_framework.response import Response
from .serializers import InboxSerializer, ChatMessageSerializer, GroupChatSerializer
from ..notification.serializers import NotificationSerializer
from .. ._models.profile import Profile
from .. ._models.notification import Notification, NotificationType
from .. ._models.inbox import ChatMessage, GroupChat, Inbox

"""create notification"""
def create_notif(notified_by, inbox, notif_type):
    notif_type = NotificationType.objects.get(name=notif_type)
    notif = Notification.objects.create(notified_by=notified_by, notification_type=notif_type, inbox_rel=inbox)
    return notif

class InboxList(generics.ListCreateAPIView):
    serializer_class = InboxSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        return profile.inbox.order_by('-last_modified')
    
    def create(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
        receiver_pk = request.data.get('receiverId')
        text = request.data.get('text')

        """user profiles"""
        receiver = Profile.objects.get(pk=receiver_pk)
        profile = Profile.objects.get(pk=user_pk)

        """create new message"""
        message = ChatMessage.objects.create(person=profile, text=text)
        serializer = ChatMessageSerializer(message, context={'request': request})

        """create inbox"""
        instance = Inbox.objects.create(chat_with=receiver, unread=0)
        instance.messages.add(message)
        profile.inbox.add(instance)
        data = {
            'inbox': self.serializer_class(instance, context={'request': request}).data,
            'message': serializer.data
        }

        """find receiver inbox to avoid double instance"""
        find_inbox = receiver.inbox.filter(chat_with=profile)
        if find_inbox.count() > 0:
            receiver_inbox = find_inbox[0]
            receiver_inbox.messages.add(message)
            receiver_inbox.unread += 1
            receiver_inbox.save()
            data['receiver_update'] = { 'pk': receiver_inbox.pk, 'message': serializer.data }
            new_notif = create_notif(profile, receiver_inbox, 'inbox')
            receiver.notifications.add(new_notif)
            notif = NotificationSerializer(new_notif, context={'request': request}).data
            data['notif'] = notif
        else:
            create_new = Inbox.objects.create(chat_with=profile)
            create_new.messages.add(message)
            receiver.inbox.add(create_new)
            data['receiver_create'] = self.serializer_class(create_new, context={'request': request}).data
            new_notif = create_notif(profile, create_new, 'inbox')
            receiver.notifications.add(new_notif)
            notif = NotificationSerializer(new_notif, context={'request': request}).data
            data['notif'] = notif

        return Response(data, status=status.HTTP_200_OK)

class InboxDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = InboxSerializer
    queryset = Inbox.objects.all()

    def update(self, request, *args, **kwargs):
        cu = request.query_params.get('cu')
        inbox = self.get_object()
        
        """clear unread"""
        if cu == 'true':
            inbox.unread = 0
            inbox.save()
            return Response({'status': True}, status=status.HTTP_200_OK)
        
        user_pk = kwargs.get('user_pk')
        receiver_pk = request.data.get('receiverId')
        text = request.data.get('text')
        initial = request.data.get('initialSend')

        """user profiles"""
        profile = Profile.objects.get(pk=user_pk)
        receiver = Profile.objects.get(pk=receiver_pk)

        """send message"""
        message = ChatMessage.objects.create(person=profile, text=text)
        inbox.messages.add(message)
        serializer = ChatMessageSerializer(message, context={'request': request})
        data = { 'message': serializer.data }

        """receiver chat"""
        find_inbox = receiver.inbox.filter(chat_with=profile)
        if find_inbox.count() > 0:
            receiver_inbox = find_inbox[0]
            receiver_inbox.messages.add(message)
            receiver_inbox.unread += 1
            receiver_inbox.save()
            data['receiver_update'] = { 'pk': receiver_inbox.pk, 'message': serializer.data }
            if initial:
                new_notif = create_notif(profile, receiver_inbox, 'inbox')
                receiver.notifications.add(new_notif)
                notif = NotificationSerializer(new_notif, context={'request': request}).data
                data['notif'] = notif
        else:
            create_new = Inbox.objects.create(chat_with=profile)
            create_new.messages.add(message)
            receiver.inbox.add(create_new)
            data['receiver_create'] = self.serializer_class(create_new, context={'request': request}).data
            if initial:
                new_notif = create_notif(profile, create_new, 'inbox')
                receiver.notifications.add(new_notif)
                notif = NotificationSerializer(new_notif, context={'request': request}).data
                data['notif'] = notif

        return Response(data, status=status.HTTP_200_OK)

class GroupInboxDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = GroupChatSerializer
    queryset = Inbox.objects.all()

    def get_object(self):
        pk = self.kwargs.get('pk')
        inbox = self.get_queryset().filter(pk=pk)[0]
        return inbox.group_chat
    
    def update(self, request, *args, **kwargs):
        pk = self.kwargs.get('pk')
        cu = request.query_params.get('cu')
        group_chat = self.get_object()
        inbox = Inbox.objects.get(pk=pk)
        initial = request.data.get('initialSend')
        role = request.data.get('role')
        
        """clear unread"""
        if cu == 'true':
            inbox.unread = 0
            inbox.save()
            return Response({'status': True}, status=status.HTTP_200_OK)
        
        """send message"""
        user_pk = kwargs.get('user_pk')
        text = request.data.get('text')
        profile = Profile.objects.get(pk=user_pk)
        participants = group_chat.participants.all()
        for participant in participants:
            if profile != participant:
                participant_inbox = participant.inbox.filter(group_chat__pk=group_chat.pk)[0]
                participant_inbox.unread = participant_inbox.unread + 1
                participant_inbox.save()
                
                if initial:
                    notif_type = 'group inbox'
                    new_notif = create_notif(profile, inbox, notif_type)
                    participant.notifications.add(new_notif)

        message = ChatMessage.objects.create(person=profile, text=text)
        group_chat.messages.add(message)
        serializer = ChatMessageSerializer(message, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)