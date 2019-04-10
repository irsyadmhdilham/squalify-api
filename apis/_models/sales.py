from django.db import models
from .contact import Contact
from django.utils import timezone

class SalesType(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return self.name

class SalesStatus(models.Model):
    name = models.CharField(max_length=30, unique=True)

    class Meta:
        verbose_name_plural = 'Sales status'

    def __str__(self):
        return self.name

class Sales(models.Model):
    timestamp = models.DateTimeField(default=timezone.now)
    location = models.CharField(max_length=200, null=True, blank=True)
    amount = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    commission = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    sales_type = models.ForeignKey(SalesType, on_delete=models.CASCADE)
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE, null=True, blank=True)
    sales_status = models.ForeignKey(SalesStatus, on_delete=models.CASCADE, to_field='name', default='Submitted')
    client_name = models.CharField(max_length=200, null=True, blank=True)
    tips = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name_plural = 'Sales'

    def __str__(self):
        return str(self.timestamp)
