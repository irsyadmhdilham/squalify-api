# Generated by Django 2.1.2 on 2019-01-29 15:26

import apis._models.inbox
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0006_post_tips'),
    ]

    operations = [
        migrations.AddField(
            model_name='groupchat',
            name='group_image',
            field=models.ImageField(default='no_image.jpeg', upload_to=apis._models.inbox.image_directory_path),
        ),
    ]