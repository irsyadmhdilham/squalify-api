from rest_framework import serializers

class GroupSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    designation = serializers.CharField(read_only=True)
    profile_image = serializers.ImageField(read_only=True)
    amount = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)