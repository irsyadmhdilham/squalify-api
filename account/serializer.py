from rest_framework import serializers
from account.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('pk', 'email', 'password',)
    
    def create(self, validated_data):
        email = validated_data.get('email')
        password = validated_data.get('password')
        try:
            user = User.objects.get(email=email)
            if not None:
                raise ValueError
        except ValueError as error:
            return error