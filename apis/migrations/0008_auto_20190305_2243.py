# Generated by Django 2.1.2 on 2019-03-05 22:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0007_auto_20190302_0509'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sales',
            name='document_id',
        ),
        migrations.RemoveField(
            model_name='sales',
            name='repeat_sales',
        ),
        migrations.RemoveField(
            model_name='sales',
            name='surcharge',
        ),
    ]
