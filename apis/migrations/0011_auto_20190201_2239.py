# Generated by Django 2.1.2 on 2019-02-01 22:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0010_auto_20190201_1455'),
    ]

    operations = [
        migrations.CreateModel(
            name='FcmToken',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('token', models.TextField()),
            ],
        ),
        migrations.RemoveField(
            model_name='profile',
            name='fcm_token',
        ),
        migrations.AddField(
            model_name='fcmtoken',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='profile',
            name='fcm_token',
            field=models.ManyToManyField(blank=True, to='apis.FcmToken'),
        ),
    ]