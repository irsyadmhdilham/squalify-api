from django.contrib import admin
from .._models.point import Point, PointField, PointAttribute, PointLog, PointLogType

admin.site.register(PointAttribute)
admin.site.register(PointField)
admin.site.register(Point)
admin.site.register(PointLog)
admin.site.register(PointLogType)