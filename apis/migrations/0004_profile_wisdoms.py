# Generated by Django 2.1.2 on 2019-01-28 03:35

import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0003_auto_20190124_2248'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='wisdoms',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.TextField(), default=list, size=None),
        ),
    ]