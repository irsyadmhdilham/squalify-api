from django.db import models
from .sales import Sales
from .contact import Contact

class PostType(models.Model):
    name = models.CharField(max_length=30)

    def __str__(self):
        return self.name

class Comment(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    commented_by = models.ForeignKey('Profile', on_delete=models.CASCADE)
    text = models.TextField()

    def __str__(self):
        return str(self.timestamp)

class Like(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    likers = models.ForeignKey('Profile', on_delete=models.CASCADE)

    def __str__(self):
        return str(self.timestamp)

class Post(models.Model):
    posted_by = models.ForeignKey('Profile', on_delete=models.CASCADE)
    post_type = models.ForeignKey(PostType, on_delete=models.CASCADE)
    sales_rel = models.ForeignKey(Sales, on_delete=models.CASCADE, blank=True, null=True)
    users_tagged = models.ManyToManyField('Profile', blank=True, related_name='users')
    contact_rel = models.ForeignKey(Contact, on_delete=models.CASCADE, blank=True, null=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    comments = models.ManyToManyField(Comment, blank=True)
    likes = models.ManyToManyField(Like, blank=True)

    def __str__(self):
        return '{}, posted on {}'.format(self.posted_by.name, self.timestamp)