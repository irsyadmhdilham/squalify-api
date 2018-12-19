from django.contrib import admin
from .._models.sales import Sales, SalesType, Surcharge, SalesStatus

admin.site.register(SalesType)
admin.site.register(Sales)
admin.site.register(Surcharge)
admin.site.register(SalesStatus)