from rest_framework import generics
from .serializers import SalesSerializer
from apis._models.profile import Profile
from apis._models.sales import Sales, SalesType, Surcharge

class SalesList(generics.ListCreateAPIView):
    serializer_class = SalesSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).sales.all().order_by('timestamp')
    
    def perform_create(self, serializer):
        pass