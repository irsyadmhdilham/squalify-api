from rest_framework import generics, status
from rest_framework.response import Response
from apis._models.agency import Agency
from .serializers import AgencySerializer, ProfileSerializer, AgencyImageSerializer, AgencyAdminSerializer
from django.utils import timezone
from .. .functions.image import ImageMutation
from django.conf import settings

base_dir = settings.BASE_DIR

class AgencyDetail(generics.RetrieveUpdateAPIView):
    serializer_class = AgencySerializer
    queryset = Agency.objects.all()

class AgencyMembers(generics.ListAPIView):
    serializer_class = ProfileSerializer
    
    def get_queryset(self):
        pk = self.kwargs.get('pk')
        agency = Agency.objects.get(pk=pk)
        members = agency.members
        return members

class AgencyImage(generics.RetrieveUpdateAPIView):
    serializer_class = AgencyImageSerializer
    queryset = Agency.objects.all()

    def update(self, request, *args, **kwargs):
        agency = self.get_object()
        agency_image = request.data.get('agency_image')
        date = timezone.now().isoformat()
        agency_image._set_name(f'agency_image_{date}.jpg')
        old_path = base_dir + self.serializer_class(agency).data['agency_image']
        image = ImageMutation()
        image.remove_image(old_path)
        agency.agency_image = agency_image
        agency.save()
        new_path = base_dir + self.serializer_class(agency).data['agency_image']
        image.resize_image(150, new_path)
        serializer = self.serializer_class(agency, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class AllAgencies(generics.ListAPIView):
    serializer_class = AgencyAdminSerializer
    queryset = Agency.objects.all()