from django.db import models

class Industry(models.Model):
    industry = models.CharField(max_length=30)

    class Meta:
        verbose_name_plural = 'Industries'

    def __str__(self):
        return self.industry