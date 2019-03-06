from django.contrib import admin
from .._models.sales import Sales, SalesType, SalesStatus

admin.site.register(SalesType)
admin.site.register(Sales)
admin.site.register(SalesStatus)