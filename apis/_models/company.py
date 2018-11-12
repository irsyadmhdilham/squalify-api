from django.db import models

class Company(models.Model):
    company = models.CharField(max_length=30)

    def __str__(self):
        return self.company