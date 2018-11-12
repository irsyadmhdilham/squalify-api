from rest_framework import serializers
from apis._models.notification import Notification
from apis._models.profile import Profile

class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Profile
        fields = ('url', 'id', 'name', 'profile_image',)

class NotificationSerializer(serializers.HyperlinkedModelSerializer):
    notified_by = ProfileSerializer(read_only=True)

    class Meta:
        model = Notification
        fields = ('url', 'notified_by', 'notification_type', 'timestamp')