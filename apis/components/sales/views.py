from rest_framework import generics, status
from django.conf import settings
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Q, Count
from django.utils import timezone
from dateutil import parser

from .serializers import SalesSerializer, SummarySerializer

from apis._models.profile import Profile
from .. ._models.point import Point, PointLogType, PointLog, PointField, PointAttribute
from apis._models.agency import Agency
from apis._models.post import Post, PostType
from apis._models.sales import Sales, SalesType, SalesStatus
from .. ._models.contact import Contact
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
        date_from = self.request.query_params.get('f')
        date_until = self.request.query_params.get('u')
        profile = Profile.objects.get(pk=user_pk)
        sales = profile.sales
        sf = SalesFilter(sales, period, sales_type, status, date_from, date_until)
        return sf.result()
    
    def perform_create(self, serializer):
        # request data
        user_pk = self.kwargs.get('user_pk')
        sales_type = self.request.data.get('sales_type')
        amount = self.request.data.get('amount')
        status = self.request.data.get('sales_status')
        contact = self.request.data.get('contact')
        client = self.request.data.get('client_name')
        ts = self.request.query_params.get('ts')
        timestamp = self.request.data.get('timestamp')

        # instances
        profile = Profile.objects.get(pk=user_pk)
        sales_type_instance = SalesType.objects.get(name=sales_type)
        sales_status = SalesStatus.objects.get(name=status)
        designation = profile.designation.name
        company = profile.agency.company.name

        # income calculations
        income_ins = Income(comm_struct, amount, designation, company, sales_type)
        income = income_ins.self_income()
        instance = None
        if contact is not None:
            _contact = Contact.objects.get(pk=contact)
            instance = serializer.save(sales_type=sales_type_instance, commission=income, sales_status=sales_status, contact=_contact)
        else:
            instance = serializer.save(sales_type=sales_type_instance, commission=income, sales_status=sales_status)
        profile.sales.add(instance)

        if ts is None:
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
        
        # Add point
        pt = 'Case closed'
        point = profile.points.filter(date=timezone.now().date())
        point_field = PointField.objects.get(name=pt)
        point_type = PointLogType.objects.get(name='Add')
        if point.count() == 0:
            attr = PointAttribute.objects.create(attribute=point_field, point=4)
            point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=4)
            create = Point.objects.create()
            create.attributes.add(attr)
            create.logs.add(point_log)
            profile.points.add(create)
        else:
            p = point[0]
            get_attr = p.attributes.filter(attribute__name=pt)

            total = 4
            if get_attr.count() > 0:
                attr = get_attr[0]
                total = attr.point + 4
                attr.point = total
                attr.save()
            else:
                attr = PointAttribute.objects.create(attribute=point_field, point=total)
                p.attributes.add(attr)
            point_log = PointLog.objects.create(point_type=point_type, attribute=point_field, point=total)
            p.logs.add(point_log)

class SalesDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = SalesSerializer
    queryset = Sales.objects.all()

    def perform_update(self, serializer):
        sales_type = self.request.data.get('sales_type')
        status = self.request.data.get('sales_status')
        contact = self.request.data.get('contact')
        
        # instances
        sales_type_obj = SalesType.objects.get(name=sales_type)
        sales_status = SalesStatus.objects.get(name=status)
        
        if contact is not None:
            _contact = Contact.objects.get(pk=contact)
            serializer.save(sales_type=sales_type_obj, sales_status=sales_status, contact=_contact, client_name=None)
        else:
            serializer.save(sales_type=sales_type_obj, sales_status=sales_status, contact=None)

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
