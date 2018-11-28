from rest_framework import serializers
from apis._models.point import Point, PointAttribute

class PointAttributeSerializer(serializers.ModelSerializer):
    attribute = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = PointAttribute
        fields = ('pk', 'attribute', 'point',)

class PointSerializer(serializers.ModelSerializer):
    attributes = PointAttributeSerializer(many=True, read_only=True)

    class Meta:
        model = Point
        fields = ('pk', 'attributes', 'logs', 'date',)

class AllPointSerializer(serializers.Serializer):
    personal = serializers.IntegerField(read_only=True)
    group = serializers.IntegerField(read_only=True)
    agency = serializers.IntegerField(read_only=True)