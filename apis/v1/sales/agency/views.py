from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
# from ..functions.agency import Agency
# from ..functions.period.summary import Summary
from .. .._models.profile import Profile
from .serializers import AgencySerializer, AgencySummarySerializer

# class YearAgencySales(APIView):

#     def get(self, request, user_pk):
#         q = request.query_params.get('q')
#         profile = Profile.objects.get(pk=user_pk)
#         members = profile.agency.members.all()
#         data = None
#         agency = Agency(members)
#         if q == 'epf':
#             data = agency.year_epf()
#         elif q == 'cash':
#             data = agency.year_cash()
#         elif q == 'asb':
#             data = agency.year_asb()
#         elif q == 'prs':
#             data = agency.year_prs()
#         else:
#             data = agency.year_total()
#         serializer = AgencySerializer(data, many=True, context={'request': request})
#         return Response(serializer.data, status=status.HTTP_200_OK)

# class MonthAgencySales(APIView):

#     def get(self, request, user_pk):
#         q = request.query_params.get('q')
#         profile = Profile.objects.get(pk=user_pk)
#         members = profile.agency.members.all()
#         data = None
#         agency = Agency(members)
#         if q == 'epf':
#             data = agency.month_epf()
#         elif q == 'cash':
#             data = agency.month_cash()
#         elif q == 'asb':
#             data = agency.month_asb()
#         elif q == 'prs':
#             data = agency.month_prs()
#         else:
#             data = agency.month_total()
#         serializer = AgencySerializer(data, many=True, context={'request': request})
#         return Response(serializer.data, status=status.HTTP_200_OK)

# class WeekAgencySales(APIView):

#     def get(self, request, user_pk):
#         q = request.query_params.get('q')
#         profile = Profile.objects.get(pk=user_pk)
#         members = profile.agency.members.all()
#         data = None
#         agency = Agency(members)
#         if q == 'epf':
#             data = agency.week_epf()
#         elif q == 'cash':
#             data = agency.week_cash()
#         elif q == 'asb':
#             data = agency.week_asb()
#         elif q == 'prs':
#             data = agency.week_prs()
#         else:
#             data = agency.week_total()
#         serializer = AgencySerializer(data, many=True, context={'request': request})
#         return Response(serializer.data, status=status.HTTP_200_OK)

# class TodayAgencySales(APIView):

#     def get(self, request, user_pk):
#         q = request.query_params.get('q')
#         profile = Profile.objects.get(pk=user_pk)
#         members = profile.agency.members.all()
#         data = None
#         agency = Agency(members)
#         if q == 'epf':
#             data = agency.today_epf()
#         elif q == 'cash':
#             data = agency.today_cash()
#         elif q == 'asb':
#             data = agency.today_asb()
#         elif q == 'prs':
#             data = agency.today_prs()
#         else:
#             data = agency.today_total()
#         serializer = AgencySerializer(data, many=True, context={'request': request})
#         return Response(serializer.data, status=status.HTTP_200_OK)

# class AgencySummarySales(APIView):

#     def get(self, request, user_pk):
#         profile = Profile.objects.get(pk=user_pk)
#         members = profile.agency.members.all()
#         q = request.query_params.get('q')
#         summary = Summary(members)

#         data = {
#             'year': summary.year(q),
#             'month': summary.month(q),
#             'week': summary.week(q),
#             'today': summary.today(q)
#         }
#         serializer = AgencySummarySerializer(data)
#         return Response(serializer.data, status=status.HTTP_200_OK)
