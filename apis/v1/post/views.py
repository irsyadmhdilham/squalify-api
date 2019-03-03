from rest_framework import generics
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from .. ._models.post import Post, Comment, Like, Memo, PostType
from .. ._models.profile import Profile
from .. ._models.agency import Agency
from .serializers import PostSerializer, CommentSerializer, LikeSerializer
from .. ._models.notification import Notification, NotificationType
from .. .functions.push_notification import NotificationInit
from dateutil import parser

"""create notification"""
def create_notif(notified_by, post, notif_type):
    notif_type = NotificationType.objects.get(name=notif_type)
    notif = Notification.objects.create(notified_by=notified_by, notification_type=notif_type, post_rel=post)
    return notif

class PostList(generics.ListCreateAPIView):
    serializer_class = PostSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)
    
    def get_queryset(self):
        agency_pk = self.kwargs.get('agency_pk')
        agency = Agency.objects.get(pk=agency_pk)
        return agency.posts.order_by('-timestamp')
    
    def perform_create(self, serializer):
        pk = self.kwargs.get('agency_pk')
        user_pk = self.request.data.get('userId')
        text = self.request.data.get('text')
        start_date = self.request.data.get('startDate')
        end_date = self.request.data.get('endDate')
        countdown = self.request.data.get('countdown')

        if start_date is not None:
            start_date = parser.parse(start_date)

        if end_date is not None:
            end_date = parser.parse(end_date)
        
        if countdown is not None:
            countdown = parser.parse(countdown)

        posts = Agency.objects.get(pk=pk).posts
        posted_by = Profile.objects.get(pk=user_pk)

        post_type = PostType.objects.get(name='memo')

        """create memo"""
        memo = None
        if countdown is not None:
            memo = Memo.objects.create(start_date=start_date, end_date=end_date, text=text, countdown=countdown)
        else:
            memo = Memo.objects.create(start_date=start_date, end_date=end_date, text=text)

        """create post"""
        post = serializer.save(posted_by=posted_by, post_type=post_type, memo=memo)
        posts.add(post)

class PostDetail(generics.RetrieveUpdateAPIView):
    serializer_class = PostSerializer
    queryset = Post.objects.all()
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def perform_update(self, serializer):
        pk = self.kwargs.get('pk')
        text = self.request.data.get('text')
        start_date = self.request.data.get('startDate')
        end_date = self.request.data.get('endDate')
        countdown = self.request.data.get('countdown')

        if start_date is not None:
            start_date = parser.parse(start_date)

        if end_date is not None:
            end_date = parser.parse(end_date)
        
        if countdown is not None:
            countdown = parser.parse(countdown)

        memo = Post.objects.get(pk=pk).memo
        memo.text = text
        memo.start_date = start_date
        memo.end_date = end_date
        if countdown is not None:
            memo.countdown = countdown
        memo.save()

class CommentList(generics.ListCreateAPIView):
    serializer_class = CommentSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)
    
    def get_queryset(self):
        pk = self.kwargs.get('pk')
        return Post.objects.get(pk=pk).comments.all()
    
    def perform_create(self, serializer):
        pk = self.kwargs.get('pk')
        user_pk = self.request.data.get('userId')
        text = self.request.data.get('text')
        profile = Profile.objects.get(pk=user_pk)
        post = Post.objects.get(pk=pk)
        instance = serializer.save(commented_by=profile, text=text)
        post.comments.add(instance)

        """notification"""
        posted_by = post.posted_by
        if posted_by != profile:
            notif = create_notif(profile, post, 'comment')
            posted_by.notifications.add(notif)
            fcm_token = posted_by.fcm_token
            if fcm_token.count() > 0:
                data = {
                    'title': 'comment post',
                    'post_id': str(post.pk),
                    'notif_id': str(notif.pk)
                }
                send_notif = NotificationInit(f'{profile.name} commented your post', text, data, True)
                send_notif.send(fcm_token)

class LikeList(generics.ListCreateAPIView):
    serializer_class = LikeSerializer
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def get_queryset(self):
        pk = self.kwargs.get('pk')
        return Post.objects.get(pk=pk).likes.all()
    
    def perform_create(self, serializer):
        pk = self.kwargs.get('pk')
        user_pk = self.request.data.get('userId')
        profile = Profile.objects.get(pk=user_pk)
        post = Post.objects.get(pk=pk)
        instance = serializer.save(liker=profile)
        post.likes.add(instance)

        """notification"""
        posted_by = post.posted_by
        if posted_by != profile:
            notif = create_notif(profile, post, 'like')
            posted_by.notifications.add(notif)
            fcm_token = posted_by.fcm_token
            if fcm_token.count() > 0:
                data = {
                    'title': 'like post',
                    'post_id': str(post.pk),
                    'notif_id': str(notif.pk)
                }
                send_notif = NotificationInit('Post liked', f'{profile.name} liked your post', data, True)
                send_notif.send(fcm_token)

class Unlike(generics.DestroyAPIView):
    serializer_class = LikeSerializer
    queryset = Like.objects.all()
    authentication_classes = (TokenAuthentication, SessionAuthentication,)

    def perform_destroy(self, instance):
        post_pk = self.kwargs.get('post_pk')
        post = Post.objects.get(pk=post_pk)
        post.likes.remove(instance)
        instance.delete()
