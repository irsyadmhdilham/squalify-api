from rest_framework import generics
from apis._models.post import Post
from .serializers import PostSerializer

class PostDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = PostSerializer
    queryset = Post.objects.all()