from rest_framework import serializers

class PointSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    total = serializers.IntegerField(read_only=True)

class MemberSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    name = serializers.CharField(read_only=True)
    designation = serializers.CharField(read_only=True)
    profile_image = serializers.ImageField(read_only=True)
    point = PointSerializer(read_only=True)
    downline = serializers.IntegerField(read_only=True)

class MemberPointSerializer(serializers.Serializer):
    pk = serializers.IntegerField(read_only=True)
    date = serializers.DateField(read_only=True)
    point = serializers.IntegerField(read_only=True)

class PointsSerializer(serializers.Serializer):
    date = serializers.DateField(read_only=True)
    total = serializers.IntegerField(read_only=True)
