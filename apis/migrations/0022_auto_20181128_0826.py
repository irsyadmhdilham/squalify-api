# Generated by Django 2.1.2 on 2018-11-28 08:26

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0021_auto_20181126_1017'),
    ]

    operations = [
        migrations.RenameField(
            model_name='post',
            old_name='contact_relation',
            new_name='contact_rel',
        ),
        migrations.RenameField(
            model_name='post',
            old_name='sales_relation',
            new_name='sales_rel',
        ),
    ]
