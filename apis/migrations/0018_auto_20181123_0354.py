# Generated by Django 2.1.2 on 2018-11-23 03:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0017_auto_20181122_0433'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pointattribute',
            old_name='point_attr',
            new_name='attribute',
        ),
    ]
