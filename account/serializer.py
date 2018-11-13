from rest_framework import serializers
from django.conf import settings.AUTH_USER_MODEL as User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('pk', 'email', 'password',)