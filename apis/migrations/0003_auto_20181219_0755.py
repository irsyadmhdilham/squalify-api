# Generated by Django 2.1.2 on 2018-12-19 07:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0002_auto_20181213_0723'),
    ]

    operations = [
        migrations.CreateModel(
            name='Chat',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('group_name', models.CharField(blank=True, max_length=200, null=True)),
                ('composed_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Profile')),
            ],
        ),
        migrations.CreateModel(
            name='ChatMessage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('text', models.TextField()),
                ('person', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Profile')),
            ],
        ),
        migrations.CreateModel(
            name='ChatType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=150)),
            ],
        ),
        migrations.RemoveField(
            model_name='conversation',
            name='subscriber',
        ),
        migrations.RemoveField(
            model_name='inbox',
            name='conversation',
        ),
        migrations.RemoveField(
            model_name='inbox',
            name='sender',
        ),
        migrations.DeleteModel(
            name='Conversation',
        ),
        migrations.AddField(
            model_name='chat',
            name='messages',
            field=models.ManyToManyField(to='apis.ChatMessage'),
        ),
        migrations.AddField(
            model_name='chat',
            name='participants',
            field=models.ManyToManyField(blank=True, related_name='members', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='inbox',
            name='chat',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='apis.Chat'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='inbox',
            name='chat_type',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='apis.ChatType'),
            preserve_default=False,
        ),
    ]
