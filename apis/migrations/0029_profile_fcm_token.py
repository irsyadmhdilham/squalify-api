# Generated by Django 2.1.2 on 2018-12-09 06:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0028_auto_20181208_1332'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='fcm_token',
            field=models.TextField(blank=True, null=True),
        ),
    ]
