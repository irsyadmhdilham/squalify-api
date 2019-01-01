from rest_framework import generics
from .. ._models.post import Post, Comment, Like
from .. ._models.profile import Profile
from .. ._models.agency import Agency
from .serializers import PostSerializer, CommentSerializer, LikeSerializer
from .. ._models.notification import Notification, NotificationType
from .. .functions.push_notification import SendNotification

"""create notification"""
def create_notif(notified_by, post, notif_type):
    notif_type = NotificationType.objects.get(name=notif_type)
    notif = Notification.objects.create(notified_by=notified_by, notification_type=notif_type, post_rel=post)
    return notif

class PostList(generics.ListAPIView):
    serializer_class = PostSerializer
    
    def get_queryset(self):
        agency_pk = self.kwargs.get('agency_pk')
        agency = Agency.objects.get(pk=agency_pk)
        return agency.posts.order_by('-timestamp')

class PostDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = PostSerializer
    queryset = Post.objects.all()

class CommentList(generics.ListCreateAPIView):
    serializer_class = CommentSerializer
    
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
            if fcm_token is not None:
                message = f'{profile.name} commented your post'
                data = {
                    'title': 'comment post',
                    'post_id': post.pk,
                    'notif_id': notif.pk
                }
                send_notif = SendNotification(fcm_token, message, data, True)
                send_notif.send()

class LikeList(generics.ListCreateAPIView):
    serializer_class = LikeSerializer

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
            if fcm_token is not None:
                message = f'{profile.name} liked your post'
                data = {
                    'title': 'like post',
                    'post_id': post.pk,
                    'notif_id': notif.pk
                }
                send_notif = SendNotification(fcm_token, message, data)
                send = send_notif.send()
                print(send)

class Unlike(generics.DestroyAPIView):
    serializer_class = LikeSerializer
    queryset = Like.objects.all()

    def perform_destroy(self, instance):
        post_pk = self.kwargs.get('post_pk')
        post = Post.objects.get(pk=post_pk)
        post.likes.remove(instance)
        instance.delete()
