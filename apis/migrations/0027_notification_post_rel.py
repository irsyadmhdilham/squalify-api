# Generated by Django 2.1.2 on 2018-12-08 04:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0026_auto_20181203_0820'),
    ]

    operations = [
        migrations.AddField(
            model_name='notification',
            name='post_rel',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Post'),
        ),
    ]
