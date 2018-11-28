from rest_framework import generics
from .serializers import SalesSerializer
from apis._models.profile import Profile
from apis._models.agency import Agency
from apis._models.post import Post, PostType
from apis._models.sales import Sales, SalesType, Surcharge
from apis.functions.income import Income
import json
import os

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
        path = os.path.abspath(os.path.dirname(__file__) + "../../../../assets/commissions-struct.json")
        file = open(path, 'r')
        comm_struct = json.loads(file.read())
        income_ins = Income(comm_struct, amount, designation, company, sales_type)
        income = income_ins.self_income()
        file.close()
        
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