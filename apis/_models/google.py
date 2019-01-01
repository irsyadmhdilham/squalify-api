from django.db import models

class GoogleApi(models.Model):
    access_token = models.TextField(null=True, blank=True)

    def __str__(self):
        token = self.access_token
        return token