from rest_framework import generics, status
from django.conf import settings
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Q, Count
from django.utils import timezone

from .serializers import SalesSerializer, SummarySerializer

from apis._models.profile import Profile
from apis._models.agency import Agency
from apis._models.post import Post, PostType
from apis._models.sales import Sales, SalesType, SalesStatus
from .. ._models.notification import Notification, NotificationType

from .functions.sales_filter import SalesFilter
from .functions.income import Income
from .functions.summary import Summary

from .. .functions.push_notification import NotificationInit
import json
import os
import asyncio

path = os.path.abspath(os.path.dirname(__file__) + "../../../../static/commissions-struct.json")
file = open(path, 'r')
comm_struct = json.loads(file.read())
file.close()

# create notification
def create_notif(notified_by, post, notif_type):
    notif_type = NotificationType.objects.get(name=notif_type)
    notif = Notification.objects.create(notified_by=notified_by, notification_type=notif_type, post_rel=post)
    return notif

class SalesList(generics.ListCreateAPIView):
    serializer_class = SalesSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        period = self.request.query_params.get('p')
        sales_type = self.request.query_params.get('st')
        status = self.request.query_params.get('s')
        profile = Profile.objects.get(pk=user_pk)
        sales = profile.sales
        sf = SalesFilter(sales, period, sales_type, status)
        return sf.result()
    
    def perform_create(self, serializer):
        # request data
        user_pk = self.kwargs.get('user_pk')
        sales_type = self.request.data.get('sales_type')
        amount = self.request.data.get('amount')
        status = self.request.data.get('sales_status')

        # instances
        profile = Profile.objects.get(pk=user_pk)
        sales_type_instance = SalesType.objects.get(name=sales_type)
        sales_status = SalesStatus.objects.get(name=status)
        designation = profile.designation.name
        company = profile.agency.company.name

        # income calculations
        income_ins = Income(comm_struct, amount, designation, company, sales_type)
        income = income_ins.self_income()
        instance = serializer.save(sales_type=sales_type_instance, commission=income, sales_status=sales_status)
        profile.sales.add(instance)

        # create/update post
        today_post = Post.objects.filter(
            Q(timestamp__date=timezone.now().date()) &
            Q(posted_by__pk=user_pk)
        )
        post = None
        """
        check wether post for today has created or not
        - If not created, then create one
        """
        if today_post.count() > 0:
            # create new post
            post = today_post[0]
            post.sales_rel.add(instance)
            post.save()
        else:
            # update created post
            post_type = PostType.objects.get(name='sales closed')
            create_post = Post.objects.create(posted_by=profile, post_type=post_type)
            create_post.save()
            create_post.sales_rel.add(instance)
            profile.agency.posts.add(create_post)
            post = create_post

        # Create notification
        members_with_token = (profile.agency.members
                            .exclude(pk=profile.pk)
                            .annotate(token_count=Count('fcm_token'))
                            .filter(token_count__gt=0))
        members = profile.agency.members.exclude(pk=profile.pk)
        new_notif = create_notif(profile, post, 'closed sales')
        for member in members:
            member.notifications.add(new_notif)
        notif_data = {
            'title': 'closed sales',
            'post_id': str(post.pk),
            'notif_id': str(new_notif.pk)
        }
        if members_with_token.count() > 0:
            notif = NotificationInit('New sales closed', f'{profile.name} just closed a sales', notif_data)
            notif.send_group(members_with_token)

class SalesRemove(generics.DestroyAPIView):
    serializer_class = SalesSerializer
    queryset = Sales.objects.all()

    def perform_destroy(self, instance):
        user_pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=user_pk)
        profile.sales.remove(instance)
        instance.delete()

class PersonalSummary(generics.RetrieveAPIView):
    serializer_class = SummarySerializer

    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=pk).sales.all()

    def get_object(self):
        sales = self.get_queryset()
        sales_type = self.request.query_params.get('st')
        summary = Summary(sales, sales_type)
        return summary.result()
