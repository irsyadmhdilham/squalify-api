# Generated by Django 2.1.2 on 2019-02-02 10:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0011_auto_20190201_2239'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='is_auth',
        ),
        migrations.AddField(
            model_name='profile',
            name='api_token',
            field=models.TextField(null=True),
        ),
    ]
