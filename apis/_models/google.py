from django.db import models

class GoogleApi(models.Model):
    access_token = models.TextField(null=True, blank=True)
    token_expiry = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return str(self.token_expiry)