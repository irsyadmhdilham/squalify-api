from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Q
from django.utils import timezone

from .serializers import SalesSerializer, SummarySerializer

from apis._models.profile import Profile
from apis._models.agency import Agency
from apis._models.post import Post, PostType
from apis._models.sales import Sales, SalesType, Surcharge

from .functions.personal import Personal
from .functions.sales_filter import SalesFilter
from .functions.income import Income
import json
import os
import itertools

path = os.path.abspath(os.path.dirname(__file__) + "../../../../static/commissions-struct.json")
file = open(path, 'r')
comm_struct = json.loads(file.read())
file.close()


class SalesList(generics.ListCreateAPIView):
    serializer_class = SalesSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        p = self.request.query_params.get('p')
        t = self.request.query_params.get('t')
        sales = Profile.objects.get(pk=user_pk).sales.all()
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

        """instances"""
        profile = Profile.objects.get(pk=user_pk)
        sales_type_instance = SalesType.objects.get(name=sales_type)
        designation = str(profile.designation)
        company = str(profile.agency.company)

        """income calculations"""
        income_ins = Income(comm_struct, amount, designation, company, sales_type)
        income = income_ins.self_income()
        
        instance = None
        if repeat_sales:
            instance = serializer.save(sales_type=sales_type_instance, commission=income, repeat_sales=True)
        else:
            instance = serializer.save(sales_type=sales_type_instance, commission=income)
        profile.sales.add(instance)

        """create/update post"""
        today_post = Post.objects.filter(
            Q(timestamp__date=timezone.now().date()) &
            Q(posted_by__pk=user_pk)
        )
        if today_post.count() > 0:
            post = today_post[0].sales_rel.add(instance)
        else:
            post_type = PostType.objects.get(name='sales closed')
            create_post = Post.objects.create(posted_by=profile, post_type=post_type)
            create_post.save()
            create_post.sales_rel.add(instance)
            profile.agency.posts.add(create_post)

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

