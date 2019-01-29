from rest_framework import generics, status
from django.conf import settings
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Q
from django.utils import timezone

from .serializers import SalesSerializer, SummarySerializer

from apis._models.profile import Profile
from apis._models.agency import Agency
from apis._models.post import Post, PostType
from apis._models.sales import Sales, SalesType, Surcharge
from .. ._models.notification import Notification, NotificationType

from .functions.personal import Personal
from .functions.sales_filter import SalesFilter
from .functions.income import Income
from .. .functions.push_notification import NotificationInit
import json
import os
import asyncio

path = os.path.abspath(os.path.dirname(__file__) + "../../../../static/commissions-struct.json")
file = open(path, 'r')
comm_struct = json.loads(file.read())
file.close()

"""create notification"""
def create_notif(notified_by, post, notif_type):
    notif_type = NotificationType.objects.get(name=notif_type)
    notif = Notification.objects.create(notified_by=notified_by, notification_type=notif_type, post_rel=post)
    return notif

class SalesList(generics.ListCreateAPIView):
    serializer_class = SalesSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        p = self.request.query_params.get('p')
        t = self.request.query_params.get('t')
        profile = Profile.objects.get(pk=user_pk)
        sales = profile.sales.all()
        sales_filter = SalesFilter(sales)
        data = None
        if t == 'epf':
            data = sales_filter.epf(p)
        elif t == 'cash':
            data = sales_filter.cash(p)
        elif t == 'asb':
            data = sales_filter.asb(p)
        elif t == 'prs':
            data = sales_filter.prs(p)
        else:
            data = sales_filter.total(p)
        return data
    
    def perform_create(self, serializer):
        """request data"""
        user_pk = self.kwargs.get('user_pk')
        sales_type = self.request.data.get('sales_type')
        repeat_sales = self.request.data.get('repeat_sales')
        amount = self.request.data.get('amount')
        surcharge_val = self.request.data.get('surcharge')
        tips = self.request.data.get('tips')

        """surcharge instance"""
        surcharge = None
        if surcharge_val:
            surcharge = Surcharge.objects.get(name=surcharge_val)

        """instances"""
        profile = Profile.objects.get(pk=user_pk)
        sales_type_instance = SalesType.objects.get(name=sales_type)
        designation = profile.designation.name
        company = profile.agency.company.name

        """income calculations"""
        income_ins = Income(comm_struct, amount, designation, company, sales_type)
        income = income_ins.self_income()
        
        instance = None
        if repeat_sales:
            if surcharge is not None:
                instance = serializer.save(sales_type=sales_type_instance, surcharge=surcharge, commission=income, repeat_sales=True)
            else:
                instance = serializer.save(sales_type=sales_type_instance, commission=income, repeat_sales=True)
        else:
            if surcharge is not None:
                instance = serializer.save(sales_type=sales_type_instance, surcharge=surcharge, commission=income)
            else:
                instance = serializer.save(sales_type=sales_type_instance, commission=income)
        profile.sales.add(instance)

        """create/update post"""
        today_post = Post.objects.filter(
            Q(timestamp__date=timezone.now().date()) &
            Q(posted_by__pk=user_pk)
        )
        post = None
        if today_post.count() > 0:
            post = today_post[0]
            if tips is not None:
                post.tips = tips
            post.sales_rel.add(instance)
            post.save()
        else:
            post_type = PostType.objects.get(name='sales closed')
            create_post = None
            if tips is not None:
                create_post = Post.objects.create(posted_by=profile, post_type=post_type, tips=tips)
            else:
                create_post = Post.objects.create(posted_by=profile, post_type=post_type)
            create_post.save()
            create_post.sales_rel.add(instance)
            profile.agency.posts.add(create_post)
            post = create_post

        """Create notification"""
        members_with_token = profile.agency.members.filter(fcm_token__isnull=False).exclude(pk=profile.pk)
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

class PersonalSummary(APIView):

    def get(self, request, user_pk):
        profile = Profile.objects.get(pk=user_pk)
        q = request.query_params.get('q')
        sales = profile.sales.all()
        designation = profile.designation.name
        company = profile.agency.company.name
        personal = Personal(sales, comm_struct, designation, company)
        year = personal.year()
        month = personal.month()
        week = personal.week()
        today = personal.today()
        def sales_compiler(type):
            return {
                'year': { 'sales': year[type], 'income': year['income'] },
                'month': { 'sales': month[type], 'income': month['income'] },
                'week': { 'sales': week[type], 'income': week['income'] },
                'today': { 'sales': today[type], 'income': today['income'] }
            }
        data = None
        if q == 'epf':
            data = sales_compiler('epf')
        elif q == 'cash':
            data = sales_compiler('cash')
        elif q == 'asb':
            data = sales_compiler('asb')
        elif q == 'prs':
            data = sales_compiler('prs')
        else:
            data = sales_compiler('total')
        serializer = SummarySerializer(data)
        return Response(serializer.data, status=status.HTTP_200_OK)

