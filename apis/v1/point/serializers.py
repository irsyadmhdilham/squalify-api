from rest_framework import serializers
from apis._models.point import Point, PointAttribute

class PointAttributeSerializer(serializers.ModelSerializer):
    point_attr = serializers.StringRelatedField(read_only=True)

    class Meta:
        model = PointAttribute
        fields = ('point_attr', 'point', 'last_modified',)

class PointSerializer(serializers.ModelSerializer):
    point = PointAttributeSerializer(many=True, read_only=True)

    class Meta:
        model = Point
        fields = ('pk', 'point', 'logs', 'date',)