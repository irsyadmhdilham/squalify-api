from django.db import models
from .contact import Contact
from django.utils import timezone

class SalesType(models.Model):
    sales_type = models.CharField(max_length=30)

    def __str__(self):
        return self.sales_type

class Surcharge(models.Model):
    surcharge = models.FloatField(default=None)

    def __str__(self):
        return str(self.surcharge)

class SalesStatus(models.Model):
    sales_status = models.CharField(max_length=30, unique=True)

    def __str__(self):
        return self.sales_status

class Sales(models.Model):
    timestamp = models.DateTimeField(default=timezone.now)
    location = models.CharField(max_length=200, null=True, blank=True)
    amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    commission = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    sales_type = models.ForeignKey(SalesType, on_delete=models.CASCADE)
    surcharge = models.ForeignKey(Surcharge, on_delete=models.CASCADE, null=True, blank=True)
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE, null=True, blank=True)
    sales_status = models.ForeignKey(SalesStatus, on_delete=models.CASCADE, to_field='sales_status', default='Submitted')
    document_id = models.CharField(max_length=100, null=True, blank=True)

    def __str__(self):
        return str(self.timestamp)
