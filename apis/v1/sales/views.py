from rest_framework import generics

from .serializers import SalesSerializer
from apis._models.profile import Profile

class SalesList(generics.ListCreateAPIView):
    serializer_class = SalesSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).sales