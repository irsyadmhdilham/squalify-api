# Generated by Django 2.1.2 on 2018-11-15 22:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0008_auto_20181114_1501'),
    ]

    operations = [
        migrations.AlterField(
            model_name='agency',
            name='agency_image',
            field=models.ImageField(default='no_image.jpeg', upload_to='uploads/agencies'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='profile_image',
            field=models.ImageField(default='no_image.jpeg', upload_to='uploads/users'),
        ),
    ]