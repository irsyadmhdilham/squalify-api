from django.db import models
from .sales import Sales
from .referral import Referral

class Post_type(models.Model):
    post_type = models.CharField(max_length=30)

    def __str__(self):
        return self.post_type

class Comment(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    commented_by = models.ForeignKey('Profile', on_delete=models.CASCADE)
    text = models.TextField()

    def __str__(self):
        return str(self.timestamp)

class Applause(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    applausers = models.ForeignKey('Profile', on_delete=models.CASCADE)

    def __str__(self):
        return str(self.timestamp)

class Post(models.Model):
    posted_by = models.ForeignKey('Profile', on_delete=models.CASCADE)
    post_type = models.ForeignKey(Post_type, on_delete=models.CASCADE)
    sales_relation = models.ForeignKey(Sales, on_delete=models.CASCADE, blank=True, null=True)
    users_tagged = models.ManyToManyField('Profile', blank=True, related_name='users')
    referral_tagged = models.ForeignKey(Referral, on_delete=models.CASCADE, blank=True, null=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    comments = models.ManyToManyField(Comment, blank=True)
    applause = models.ManyToManyField(Applause, blank=True)

    def __str__(self):
        return '{}, posted on {}'.format(self.posted_by.name, self.timestamp)