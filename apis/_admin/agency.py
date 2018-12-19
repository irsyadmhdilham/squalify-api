from django.contrib import admin
from .._models.agency import Agency, Company, Industry

admin.site.register(Agency)
admin.site.register(Company)
admin.site.register(Industry)