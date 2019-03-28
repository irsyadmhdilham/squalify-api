from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.conf import settings
from django.utils import timezone
from .serializers import InboxSerializer, ChatMessageSerializer, GroupChatSerializer, GroupImageSerializer
from ..notification.serializers import NotificationSerializer
from .. ._models.profile import Profile
from .. ._models.notification import Notification, NotificationType
from .. ._models.inbox import ChatMessage, GroupChat, Inbox
from .. .functions.push_notification import NotificationInit
import asyncio
from .. .functions.image import ImageMutation
from django.db.models import Count

base_dir = settings.BASE_DIR

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
        inbox_id = None
        notif_id = None
        if find_inbox.count() > 0:
            receiver_inbox = find_inbox[0]
            inbox_id = receiver_inbox.pk
            receiver_inbox.messages.add(message)
            receiver_inbox.unread += 1
            receiver_inbox.save()
            data['receiver_update'] = { 'pk': receiver_inbox.pk, 'message': serializer.data }
            new_notif = create_notif(profile, receiver_inbox, 'inbox')
            notif_id = new_notif.pk
            receiver.notifications.add(new_notif)
            notif = NotificationSerializer(new_notif, context={'request': request}).data
            data['notif'] = notif
        else:
            create_new = Inbox.objects.create(chat_with=profile)
            inbox_id = create_new.pk
            create_new.messages.add(message)
            receiver.inbox.add(create_new)
            data['receiver_create'] = self.serializer_class(create_new, context={'request': request}).data
            new_notif = create_notif(profile, create_new, 'inbox')
            notif_id = new_notif.pk
            receiver.notifications.add(new_notif)
            notif = NotificationSerializer(new_notif, context={'request': request}).data
            data['notif'] = notif

        """send push notification"""
        if receiver.fcm_token.count() > 0:
            notif_data = {
                'title': 'personal inbox',
                'inbox_id': str(inbox_id),
                'notif_id': str(notif_id)
            }
            notif_init = NotificationInit(f'Message: {profile.name}', text, notif_data, True)
            notif_init.send(receiver.fcm_token)

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
        notif_id = None
        inbox_id = None

        """receiver chat"""
        find_inbox = receiver.inbox.filter(chat_with=profile)
        if find_inbox.count() > 0:
            receiver_inbox = find_inbox[0]
            inbox_id = receiver_inbox.pk
            receiver_inbox.messages.add(message)
            receiver_inbox.unread += 1
            receiver_inbox.save()
            data['receiver_update'] = { 'pk': receiver_inbox.pk, 'message': serializer.data }
            if initial:
                new_notif = create_notif(profile, receiver_inbox, 'inbox')
                notif_id = new_notif.pk
                receiver.notifications.add(new_notif)
                notif = NotificationSerializer(new_notif, context={'request': request}).data
                data['notif'] = notif
        else:
            create_new = Inbox.objects.create(chat_with=profile)
            inbox_id = create_new.pk
            create_new.messages.add(message)
            receiver.inbox.add(create_new)
            data['receiver_create'] = self.serializer_class(create_new, context={'request': request}).data
            if initial:
                new_notif = create_notif(profile, create_new, 'inbox')
                notif_id = new_notif.pk
                receiver.notifications.add(new_notif)
                notif = NotificationSerializer(new_notif, context={'request': request}).data
                data['notif'] = notif

        """send push notification"""
        if receiver.fcm_token.count() > 0:
            notif_data = {
                'title': 'personal inbox',
                'inbox_id': str(inbox_id),
                'notif_id': str(notif_id)
            }
            notif_init = NotificationInit(f'Message: {profile.name}', text, notif_data, True)
            notif_init.send(receiver.fcm_token)

        return Response(data, status=status.HTTP_200_OK)

class CreateGroupImage(APIView):

    def post(self, request, *args, **kwargs):
        group_image = request.data.get('group_image')
        title = request.data.get('title')
        user_pk = request.data.get('userId')

        """instances"""
        profile = Profile.objects.get(pk=user_pk)

        date = timezone.now().isoformat()
        group_image._set_name(f'{title}_{date}.jpg')
        image = ImageMutation()
        group_chat = GroupChat.objects.create(title=title, created_by=profile, group_image=group_image)
        image_path = f'{base_dir}/uploads/{group_chat.group_image}'
        image.resize_image(150, image_path)
        
        data = {
            'pk': group_chat.pk,
            'group_image': group_chat.group_image
        }
        serializer = GroupImageSerializer(data, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class CreateGroup(APIView):

    def post(self, request, *args, **kwargs):
        user_pk = kwargs.get('user_pk')
        members = request.data.get('members')
        title = request.data.get('title')
        group_chat_id = request.data.get('chatId')

        profile = Profile.objects.get(pk=user_pk)

        group_chat = None
        if group_chat_id is None:
            group_chat = GroupChat.objects.create(title=title, created_by=profile)
        else:
            group_chat = GroupChat.objects.get(pk=group_chat_id)
        self_inbox = Inbox.objects.create(group_chat=group_chat, unread=0)
        profile.inbox.add(self_inbox)

        members.append(int(user_pk))
        get_members = Profile.objects.in_bulk(members)

        event_loop = asyncio.new_event_loop()
        asyncio.set_event_loop(event_loop)

        async def create_inbox(member):
            group_chat.participants.add(member)
            create_inbox = Inbox.objects.create(group_chat=group_chat, unread=0)
            member.inbox.add(create_inbox)

        tasks = []
        for member in get_members.values():
            tasks.append(asyncio.ensure_future(create_inbox(member)))
        event_loop.run_until_complete(asyncio.gather(*tasks))
        event_loop.close()
        
        serializer = InboxSerializer(self_inbox, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class GroupInboxDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = InboxSerializer
    queryset = Inbox.objects.all()

    def get_object(self):
        pk = self.kwargs.get('pk')
        return self.get_queryset().filter(pk=pk)[0]
    
    def update(self, request, *args, **kwargs):
        cu = request.query_params.get('cu')
        inbox = self.get_object()
        group_chat = inbox.group_chat
        initial = request.data.get('initialSend')
        
        """clear unread"""
        if cu == 'true':
            inbox.unread = 0
            inbox.save()
            return Response({'status': True}, status=status.HTTP_200_OK)
        
        """send message"""
        user_pk = kwargs.get('user_pk')
        text = request.data.get('text')
        profile = Profile.objects.get(pk=user_pk)
        participants = inbox.group_chat.participants
        message = ChatMessage.objects.create(person=profile, text=text)

        for participant in participants.all():
            participant_inbox = participant.inbox.filter(group_chat=group_chat)[0]
            if participant != profile:
                participant_inbox.unread = participant_inbox.unread + 1
            participant_inbox.save()
            participant_inbox.messages.add(message)
            
            if initial:
                notif_type = 'group inbox'
                new_notif = create_notif(profile, inbox, notif_type)
                participant.notifications.add(new_notif)

        serializer = ChatMessageSerializer(message, context={'request': request})

        """push notification"""
        participants_with_token = (participants.exclude(pk=profile.pk)
                                .annotate(token_count=Count('fcm_token'))
                                .filter(token_count__gt=0))
        if participants_with_token.count() > 0:
            notif_data = {
                'title': 'group inbox'
            }
            notif_init = NotificationInit(f'Message: {group_chat.title}', text, notif_data, True)
            notif_init.send_group(participants_with_token)
        return Response(serializer.data, status=status.HTTP_200_OK)

class DestroyInbox(generics.DestroyAPIView):
    serializer_class = InboxSerializer
    queryset = Inbox.objects.all()