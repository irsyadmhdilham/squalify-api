from rest_framework import generics
from apis._models.post import Post, Comment, Like
from apis._models.profile import Profile
from .serializers import PostSerializer, CommentSerializer, LikeSerializer

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

class Unlike(generics.DestroyAPIView):
    serializer_class = LikeSerializer
    queryset = Like.objects.all()

    def perform_destroy(self, instance):
        post_pk = self.kwargs.get('post_pk')
        post = Post.objects.get(pk=post_pk)
        post.likes.remove(instance)
        instance.delete()
