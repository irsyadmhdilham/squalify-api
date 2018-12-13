from rest_framework import serializers

class GroupSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    designation = serializers.CharField(read_only=True)
    profile_image = serializers.ImageField(read_only=True)
    amount = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    downline = serializers.IntegerField(read_only=True)

class GroupSummarySerializer(serializers.Serializer):
    today = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    week = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    month = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)
    year = serializers.DecimalField(read_only=True, max_digits=10, decimal_places=2)

class DownlineSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    profile_image = serializers.ImageField(read_only=True)
    designation = serializers.CharField(read_only=True)
    downlines = GroupSerializer(many=True, read_only=True)