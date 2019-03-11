from rest_framework import generics
from .serializers import MemoSerializer
from ..post.serializers import LikeSerializer, CommentSerializer
from .. ._models.agency import Agency
from .. ._models.memo import Memo
from .. ._models.post import Like, Comment
from .. ._models.profile import Profile
from dateutil import parser

class MemoList(generics.ListCreateAPIView):
    serializer_class = MemoSerializer

    def get_queryset(self):
        pk = self.kwargs.get('agency_pk')
        return Agency.objects.get(pk=pk).memos.order_by('-posted_date')

    def perform_create(self, serializer):
        pk = self.kwargs.get('agency_pk')
        user_pk = self.request.data.get('userId')
        agency = Agency.objects.get(pk=pk)
        posted_by = Profile.objects.get(pk=user_pk)
        memo = serializer.save(posted_by=posted_by)
        agency.memos.add(memo)

class MemoDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = MemoSerializer
    queryset = Memo.objects.all()

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