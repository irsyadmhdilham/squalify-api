# Generated by Django 2.1.2 on 2019-02-25 15:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0004_remove_profile_call_logs'),
    ]

    operations = [
        migrations.CreateModel(
            name='CallLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('remark', models.CharField(blank=True, max_length=200, null=True)),
                ('answered', models.BooleanField(default=False)),
                ('contact', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Contact')),
            ],
        ),
        migrations.AddField(
            model_name='profile',
            name='call_logs',
            field=models.ManyToManyField(blank=True, to='apis.CallLog'),
        ),
    ]
