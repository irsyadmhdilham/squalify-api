from django.db import models

class Industry(models.Model):
    industry = models.CharField(max_length=30)

    def __str__(self):
        return self.industry