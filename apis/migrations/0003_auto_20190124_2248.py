# Generated by Django 2.1.2 on 2019-01-24 22:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0002_profile_is_auth'),
    ]

    operations = [
        migrations.RenameField(
            model_name='groupchat',
            old_name='owner',
            new_name='created_by',
        ),
        migrations.AddField(
            model_name='groupchat',
            name='title',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
    ]
