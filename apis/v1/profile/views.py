from rest_framework import status, generics
from apis._models.profile import Profile
from .serializers import ProfileSerializer

class ProfileDetail(generics.RetrieveUpdateDestroyAPIView):
    lookup_field = 'pk'
    serializer_class = ProfileSerializer

    def get_queryset(self):
        return Profile.objects.all()
    
    def get_object(self):
        pk = self.kwargs.get('pk')
        return Profile.objects.get(pk=pk)