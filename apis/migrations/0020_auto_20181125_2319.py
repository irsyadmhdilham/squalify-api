# Generated by Django 2.1.2 on 2018-11-25 23:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0019_auto_20181123_0811'),
    ]

    operations = [
        migrations.RenameField(
            model_name='salesstatus',
            old_name='sales_status',
            new_name='name',
        ),
        migrations.RenameField(
            model_name='salestype',
            old_name='sales_type',
            new_name='name',
        ),
        migrations.RenameField(
            model_name='surcharge',
            old_name='surcharge',
            new_name='name',
        ),
        migrations.AddField(
            model_name='sales',
            name='repeat_sales',
            field=models.BooleanField(default=False),
        ),
    ]
