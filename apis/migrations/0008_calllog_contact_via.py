# Generated by Django 2.1.2 on 2019-03-27 16:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0007_auto_20190327_1605'),
    ]

    operations = [
        migrations.AddField(
            model_name='calllog',
            name='contact_via',
            field=models.ForeignKey(default='Call', on_delete=django.db.models.deletion.CASCADE, to='apis.ContactVia', to_field='name'),
        ),
    ]
