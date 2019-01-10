# Generated by Django 2.1.2 on 2019-01-10 05:29

import apis._models.agency
import apis._models.contact
import apis._models.profile
from django.conf import settings
import django.contrib.postgres.fields.jsonb
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Agency',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('agency_image', models.ImageField(default='no_image.jpeg', upload_to=apis._models.agency.agency_directory_path)),
            ],
            options={
                'verbose_name_plural': 'Agencies',
            },
        ),
        migrations.CreateModel(
            name='ChatMessage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('text', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            options={
                'verbose_name_plural': 'Companies',
            },
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('remark', models.TextField(blank=True, null=True)),
                ('contact_no', models.CharField(max_length=30)),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('last_modified', models.DateTimeField(auto_now=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to=apis._models.contact.contact_directory_path)),
            ],
        ),
        migrations.CreateModel(
            name='ContactStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=30, unique=True)),
            ],
            options={
                'verbose_name_plural': 'Contact status',
            },
        ),
        migrations.CreateModel(
            name='ContactType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contact_type', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Designation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='GoogleApi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('access_token', models.TextField(blank=True, null=True)),
                ('token_expiry', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='GroupChat',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('messages', models.ManyToManyField(blank=True, to='apis.ChatMessage')),
            ],
        ),
        migrations.CreateModel(
            name='GroupChatRole',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Inbox',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('unread', models.IntegerField(default=1)),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('last_modified', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name_plural': 'Inboxes',
            },
        ),
        migrations.CreateModel(
            name='Industry',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            options={
                'verbose_name_plural': 'Industries',
            },
        ),
        migrations.CreateModel(
            name='Like',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('read', models.BooleanField(default=False)),
                ('seen', models.BooleanField(default=False)),
                ('inbox_rel', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Inbox')),
            ],
        ),
        migrations.CreateModel(
            name='NotificationType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Point',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='PointAttribute',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('point', models.IntegerField(default=0)),
                ('last_modified', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='PointField',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=120)),
            ],
        ),
        migrations.CreateModel(
            name='PointLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('point', models.IntegerField(default=0)),
                ('attribute', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.PointField')),
            ],
        ),
        migrations.CreateModel(
            name='PointLogType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now=True)),
                ('comments', models.ManyToManyField(blank=True, to='apis.Comment')),
                ('contact_rel', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Contact')),
                ('likes', models.ManyToManyField(blank=True, to='apis.Like')),
            ],
        ),
        migrations.CreateModel(
            name='PostType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('profile_image', models.ImageField(default='no_image.jpeg', upload_to=apis._models.profile.user_directory_path)),
                ('settings', django.contrib.postgres.fields.jsonb.JSONField(default=apis._models.profile.default_settings)),
                ('fcm_token', models.TextField(blank=True, null=True)),
                ('agency', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Agency')),
                ('contacts', models.ManyToManyField(blank=True, to='apis.Contact')),
                ('designation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Designation')),
                ('group', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Group')),
                ('inbox', models.ManyToManyField(blank=True, to='apis.Inbox')),
                ('notifications', models.ManyToManyField(blank=True, to='apis.Notification')),
                ('points', models.ManyToManyField(blank=True, to='apis.Point')),
            ],
        ),
        migrations.CreateModel(
            name='Sales',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(default=django.utils.timezone.now)),
                ('location', models.CharField(blank=True, max_length=200, null=True)),
                ('amount', models.DecimalField(decimal_places=2, default=0.0, max_digits=10)),
                ('commission', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('document_id', models.CharField(blank=True, max_length=100, null=True)),
                ('repeat_sales', models.BooleanField(default=False)),
                ('contact', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Contact')),
            ],
            options={
                'verbose_name_plural': 'Sales',
            },
        ),
        migrations.CreateModel(
            name='SalesStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30, unique=True)),
            ],
            options={
                'verbose_name_plural': 'Sales status',
            },
        ),
        migrations.CreateModel(
            name='SalesType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Schedule',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField()),
                ('title', models.CharField(max_length=200)),
                ('remark', models.TextField(blank=True, null=True)),
                ('location', models.CharField(max_length=200)),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('last_modified', models.DateTimeField(auto_now=True)),
                ('reminder', django.contrib.postgres.fields.jsonb.JSONField(blank=True, null=True)),
                ('contact', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Contact')),
            ],
        ),
        migrations.CreateModel(
            name='Surcharge',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.FloatField(default=None)),
            ],
        ),
        migrations.AddField(
            model_name='sales',
            name='sales_status',
            field=models.ForeignKey(default='Submitted', on_delete=django.db.models.deletion.CASCADE, to='apis.SalesStatus', to_field='name'),
        ),
        migrations.AddField(
            model_name='sales',
            name='sales_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.SalesType'),
        ),
        migrations.AddField(
            model_name='sales',
            name='surcharge',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Surcharge'),
        ),
        migrations.AddField(
            model_name='profile',
            name='sales',
            field=models.ManyToManyField(blank=True, to='apis.Sales'),
        ),
        migrations.AddField(
            model_name='profile',
            name='schedules',
            field=models.ManyToManyField(blank=True, to='apis.Schedule'),
        ),
        migrations.AddField(
            model_name='profile',
            name='upline',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='profile',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='post',
            name='post_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.PostType'),
        ),
        migrations.AddField(
            model_name='post',
            name='posted_by',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='post',
            name='sales_rel',
            field=models.ManyToManyField(blank=True, to='apis.Sales'),
        ),
        migrations.AddField(
            model_name='post',
            name='users_tagged',
            field=models.ManyToManyField(blank=True, related_name='posts', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='pointlog',
            name='point_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.PointLogType'),
        ),
        migrations.AddField(
            model_name='pointattribute',
            name='attribute',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.PointField'),
        ),
        migrations.AddField(
            model_name='point',
            name='attributes',
            field=models.ManyToManyField(related_name='points', to='apis.PointAttribute'),
        ),
        migrations.AddField(
            model_name='point',
            name='logs',
            field=models.ManyToManyField(related_name='logs', to='apis.PointLog'),
        ),
        migrations.AddField(
            model_name='notification',
            name='notification_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.NotificationType'),
        ),
        migrations.AddField(
            model_name='notification',
            name='notified_by',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='notification',
            name='post_rel',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Post'),
        ),
        migrations.AddField(
            model_name='like',
            name='liker',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='inbox',
            name='chat_with',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='chat_with', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='inbox',
            name='group_chat',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.GroupChat'),
        ),
        migrations.AddField(
            model_name='inbox',
            name='messages',
            field=models.ManyToManyField(blank=True, to='apis.ChatMessage'),
        ),
        migrations.AddField(
            model_name='groupchat',
            name='owner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='groupchat',
            name='participants',
            field=models.ManyToManyField(blank=True, related_name='chats', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='groupchat',
            name='role',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.GroupChatRole'),
        ),
        migrations.AddField(
            model_name='group',
            name='members',
            field=models.ManyToManyField(blank=True, related_name='groups', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='group',
            name='owner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='owners', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='contact',
            name='contact_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.ContactType'),
        ),
        migrations.AddField(
            model_name='contact',
            name='referrer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Contact'),
        ),
        migrations.AddField(
            model_name='contact',
            name='schedules',
            field=models.ManyToManyField(blank=True, related_name='contacts', to='apis.Schedule'),
        ),
        migrations.AddField(
            model_name='contact',
            name='status',
            field=models.ForeignKey(default='None', on_delete=django.db.models.deletion.CASCADE, to='apis.ContactStatus', to_field='status'),
        ),
        migrations.AddField(
            model_name='comment',
            name='commented_by',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='chatmessage',
            name='person',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='agency',
            name='company',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Company'),
        ),
        migrations.AddField(
            model_name='agency',
            name='industry',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apis.Industry'),
        ),
        migrations.AddField(
            model_name='agency',
            name='members',
            field=models.ManyToManyField(related_name='agencies', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='agency',
            name='owner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='agency_owner', to='apis.Profile'),
        ),
        migrations.AddField(
            model_name='agency',
            name='posts',
            field=models.ManyToManyField(blank=True, to='apis.Post'),
        ),
    ]
