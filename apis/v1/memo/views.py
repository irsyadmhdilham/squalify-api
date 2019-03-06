from rest_framework import generics
from .serializers import MemoSerializer
from .. ._models.agency import Agency
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