from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
# from apis.functions.sales.group import Group
from apis._models.profile import Profile
from .serializers import GroupSerializer

class YearGroupSales(APIView):

    def get(self, request, user_pk):
        q = request.query_params.get('q')
        profile = Profile.objects.get(pk=user_pk)
        members = profile.group.members.all()
        data = None
        group = Group(members)
        if q == 'epf':
            data = group.year_epf()
        elif q == 'cash':
            data = group.year_cash()
        elif q == 'asb':
            data = group.year_asb()
        elif q == 'prs':
            data = group.year_prs()
        else:
            data = group.year_total()
        serializer = GroupSerializer(data, many=True, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class MonthGroupSales(APIView):

    def get(self, request, user_pk):
        q = request.query_params.get('q')
        profile = Profile.objects.get(pk=user_pk)
        members = profile.group.members.all()
        data = None
        group = Group(members)
        if q == 'epf':
            data = group.month_epf()
        elif q == 'cash':
            data = group.month_cash()
        elif q == 'asb':
            data = group.month_asb()
        elif q == 'prs':
            data = group.month_prs()
        else:
            data = group.month_total()
        serializer = GroupSerializer(data, many=True, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class WeekGroupSales(APIView):

    def get(self, request, user_pk):
        q = request.query_params.get('q')
        profile = Profile.objects.get(pk=user_pk)
        members = profile.group.members.all()
        data = None
        group = Group(members)
        if q == 'epf':
            data = group.week_epf()
        elif q == 'cash':
            data = group.week_cash()
        elif q == 'asb':
            data = group.week_asb()
        elif q == 'prs':
            data = group.week_prs()
        else:
            data = group.week_total()
        serializer = GroupSerializer(data, many=True, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)

class TodayGroupSales(APIView):

    def get(self, request, user_pk):
        q = request.query_params.get('q')
        profile = Profile.objects.get(pk=user_pk)
        members = profile.group.members.all()
        data = None
        group = Group(members)
        if q == 'epf':
            data = group.today_epf()
        elif q == 'cash':
            data = group.today_cash()
        elif q == 'asb':
            data = group.today_asb()
        elif q == 'prs':
            data = group.today_prs()
        else:
            data = group.today_total()
        serializer = GroupSerializer(data, many=True, context={'request': request})
        return Response(serializer.data, status=status.HTTP_200_OK)