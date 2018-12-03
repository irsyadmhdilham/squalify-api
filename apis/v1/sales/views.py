from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response

from .serializers import SalesSerializer

from apis._models.profile import Profile
from apis._models.agency import Agency
from apis._models.post import Post, PostType
from apis._models.sales import Sales, SalesType, Surcharge

from apis.functions.sales.income import Income
from apis.functions.sales.personal import Personal
import json
import os

path = os.path.abspath(os.path.dirname(__file__) + "../../../../assets/commissions-struct.json")
file = open(path, 'r')
comm_struct = json.loads(file.read())
file.close()


class SalesList(generics.ListCreateAPIView):
    serializer_class = SalesSerializer

    def get_queryset(self):
        user_pk = self.kwargs.get('user_pk')
        return Profile.objects.get(pk=user_pk).sales.all().order_by('-timestamp')
    
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

        """create post"""
        post_type = PostType.objects.get(name='sales closed')
        create_post = Post.objects.create(posted_by=profile, post_type=post_type, sales_rel=instance)
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
        personal = Personal(user_pk, comm_struct)
        result = {
            'year': personal.year(),
            'month': personal.month(),
            'today': personal.today()
        }
        return Response(result, status=status.HTTP_200_OK)