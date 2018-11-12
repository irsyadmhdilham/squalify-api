from django.db import models
from .referral import Referral
from django.utils import timezone

class Sales_type(models.Model):
    sales_type = models.CharField(max_length=30)

    def __str__(self):
        return self.sales_type

class Surcharge(models.Model):
    surcharge = models.FloatField(default=0.0)

    def __str__(self):
        return str(self.surcharge)

class Sales(models.Model):
    timestamp = models.DateTimeField(default=timezone.now)
    location = models.CharField(max_length=200)
    amount = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    sales_type = models.ForeignKey(Sales_type, on_delete=models.CASCADE)
    surcharge = models.ForeignKey(Surcharge, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.timestamp)
