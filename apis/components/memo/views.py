from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import MemoSerializer
from ..post.serializers import LikeSerializer, CommentSerializer
from .. ._models.agency import Agency
from .. ._models.memo import Memo
from .. ._models.post import Like, Comment
from .. ._models.profile import Profile
from dateutil import parser
from datetime import timedelta
from .. ._models.notification import Notification, NotificationType
from .. .functions.push_notification import NotificationInit
from django.utils import timezone
from django.db.models import Count

"""create notification"""
def create_notif(notified_by, memo, notif_type):
    notif_type = NotificationType.objects.get(name=notif_type)
    notif = Notification.objects.create(notified_by=notified_by, notification_type=notif_type, memo_rel=memo)
    return notif

class MemoList(generics.ListCreateAPIView):
    serializer_class = MemoSerializer

    def get_queryset(self):
        pk = self.kwargs.get('agency_pk')
        q = self.request.query_params.get('q')
        agency = Agency.objects.get(pk=pk)
        memos = agency.memos.filter(expiry_date__gte=timezone.now()).order_by('-posted_date')
        if q is not None:
            user_pk = self.request.query_params.get('uid')
            memos = agency.memos.filter(posted_by__pk=user_pk).order_by('-posted_date')
        return memos

    def perform_create(self, serializer):
        pk = self.kwargs.get('agency_pk')
        user_pk = self.request.data.get('userId')
        agency = Agency.objects.get(pk=pk)
        posted_by = Profile.objects.get(pk=user_pk)
        memo = serializer.save(posted_by=posted_by)
        agency.memos.add(memo)

        """notification"""
        members_with_token = (agency.members
                            .exclude(pk=posted_by.pk)
                            .annotate(token_count=Count('fcm_token'))
                            .filter(token_count__gt=0))
        members = agency.members.exclude(pk=posted_by.pk)
        new_notif = create_notif(posted_by, memo, 'memo')
        for member in members:
            member.notifications.add(new_notif)
        notif_data = {
            'title': 'New memo',
            'memo_id': str(memo.pk),
            'notif_id': str(new_notif.pk)
        }
        if members_with_token.count() > 0:
            notif = NotificationInit('New memo', f'{posted_by.name} posted new memo', notif_data, True)
            notif.send_group(members_with_token)

class MemoDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = MemoSerializer
    queryset = Memo.objects.all()

class ExtendMemo(APIView):

    def put(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        memo = Memo.objects.get(pk=pk)
        extended = memo.expiry_date + timedelta(weeks=1)
        memo.expiry_date = extended
        memo.save()
        return Response(memo.expiry_date, status=status.HTTP_200_OK)

class LikeMemo(generics.ListCreateAPIView):
    serializer_class = LikeSerializer
    queryset = Memo.objects.all()

    def perform_create(self, serializer):
        user_pk = self.request.data.get('userId')
        pk = self.request.data.get('memoId')
        profile = Profile.objects.get(pk=user_pk)
        memo = Memo.objects.get(pk=pk)
        instance = serializer.save(liker=profile)
        memo.likes.add(instance)
    
class UnlikeMemo(generics.RetrieveDestroyAPIView):
    serializer_class = LikeSerializer
    queryset = Like.objects.all()

    def perform_destroy(self, instance):
        instance.delete()

class CommentMemo(generics.ListCreateAPIView):
    serializer_class = CommentSerializer

    def get_queryset(self):
        pk = self.kwargs.get('pk')
        memo = Memo.objects.get(pk=pk)
        return memo.comments.all()

    def perform_create(self, serializer):
        pk = self.kwargs.get('pk')
        user_pk = self.request.data.get('userId')
        memo = Memo.objects.get(pk=pk)
        profile = Profile.objects.get(pk=user_pk)
        comment = serializer.save(commented_by=profile)
        memo.comments.add(comment)