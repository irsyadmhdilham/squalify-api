# Generated by Django 2.1.2 on 2018-12-08 13:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0027_notification_post_rel'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='post',
            name='sales_rel',
        ),
        migrations.AddField(
            model_name='post',
            name='sales_rel',
            field=models.ManyToManyField(blank=True, to='apis.Sales'),
        ),
    ]
