# Generated by Django 2.1.2 on 2019-02-20 23:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0002_remove_schedule_reminder'),
    ]

    operations = [
        migrations.AddField(
            model_name='schedule',
            name='reminder',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]