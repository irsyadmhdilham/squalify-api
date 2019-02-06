from django.contrib import admin
from .._models.point import Point, PointField, PointAttribute, PointLog, PointLogType

class PointAdmin(admin.ModelAdmin):
    readonly_fields = ('date',)

admin.site.register(PointAttribute)
admin.site.register(PointField)
admin.site.register(Point, PointAdmin)
admin.site.register(PointLog)
admin.site.register(PointLogType)