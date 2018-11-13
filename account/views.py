from rest_framework import viewsets
from .models import User
from .serializer import UserSerializer
from rest_framework.response import Response
from django.core.validators import EmailValidator
from django.core.exceptions import ValidationError

class UserViewSet(viewsets.ViewSet):

    def list(self, request):
        queryset = User.objects.all()
        serializer = UserSerializer(queryset, many=True)
        return Response(serializer.data)
    
    def create(self, request):
        email = request.data.get('email')
        password = request.data.get('password')
        validator = EmailValidator()
        try:
            validate = validator(email)
            return Response({"name": "Hello world"})
        except:
            return Response({"error": "Invalid email format"}, 500)