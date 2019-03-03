from rest_framework import generics
from .. .._models.profile import Profile
from .. .._models.agency import Agency
from .serializers import GroupSalesSerializer
from django.db.models import Sum, Count

class GroupSales(generics.ListAPIView):
    serializer_class = GroupSalesSerializer
    
    def get_queryset(self):
        pk = self.kwargs.get('user_pk')
        profile = Profile.objects.get(pk=pk)
        group = profile.group
        results = group.members.annotate(
            personal_sales=Sum('sales__amount'),
            group_sales=Sum('group__members__sales__amount')
        )
        return results

# class GroupSummarySales(APIView):
#     authentication_classes = (TokenAuthentication, SessionAuthentication,)

#     def get(self, request, user_pk):
#         profile = Profile.objects.get(pk=user_pk)
#         members = profile.group.members.all()
#         q = request.query_params.get('q')
#         summary = Summary(members)

#         data = {
#             'year': summary.year(q),
#             'month': summary.month(q),
#             'week': summary.week(q),
#             'today': summary.today(q)
#         }
#         serializer = GroupSummarySerializer(data)
#         return Response(serializer.data, status=status.HTTP_200_OK)

# class YearDownlineList(generics.RetrieveAPIView):
#     serializer_class = DownlineSerializer
#     queryset = Profile.objects.all()
#     authentication_classes = (TokenAuthentication, SessionAuthentication,)

#     def get_object(self):
#         pk = self.kwargs.get('member_pk')
#         q = self.kwargs.get('q')
#         profile = self.get_queryset().filter(pk=pk)[0]
#         members = profile.group.members.all()
#         group = Group(members)
#         data = None
#         if q == 'epf':
#             data = group.year_epf()
#         elif q == 'cash':
#             data = group.year_cash()
#         elif q == 'asb':
#             data = group.year_asb()
#         elif q == 'prs':
#             data = group.year_prs()
#         else:
#             data = group.year_total()
#         return {
#             'pk': profile.pk,
#             'name': profile.name,
#             'designation': profile.designation.name,
#             'profile_image': profile.profile_image,
#             'downlines': data
#         }

# class MonthDownlineList(generics.RetrieveAPIView):
#     serializer_class = DownlineSerializer
#     queryset = Profile.objects.all()
#     authentication_classes = (TokenAuthentication, SessionAuthentication,)

#     def get_object(self):
#         pk = self.kwargs.get('member_pk')
#         q = self.kwargs.get('q')
#         profile = self.get_queryset().filter(pk=pk)[0]
#         members = profile.group.members.all()
#         group = Group(members)
#         data = None
#         if q == 'epf':
#             data = group.month_epf()
#         elif q == 'cash':
#             data = group.month_cash()
#         elif q == 'asb':
#             data = group.month_asb()
#         elif q == 'prs':
#             data = group.month_prs()
#         else:
#             data = group.month_total()
#         return {
#             'pk': profile.pk,
#             'name': profile.name,
#             'designation': profile.designation.name,
#             'profile_image': profile.profile_image,
#             'downlines': data
#         }

# class WeekDownlineList(generics.RetrieveAPIView):
#     serializer_class = DownlineSerializer
#     queryset = Profile.objects.all()
#     authentication_classes = (TokenAuthentication, SessionAuthentication,)

#     def get_object(self):
#         pk = self.kwargs.get('member_pk')
#         q = self.kwargs.get('q')
#         profile = self.get_queryset().filter(pk=pk)[0]
#         members = profile.group.members.all()
#         group = Group(members)
#         data = None
#         if q == 'epf':
#             data = group.week_epf()
#         elif q == 'cash':
#             data = group.week_cash()
#         elif q == 'asb':
#             data = group.week_asb()
#         elif q == 'prs':
#             data = group.week_prs()
#         else:
#             data = group.week_total()
#         return {
#             'pk': profile.pk,
#             'name': profile.name,
#             'designation': profile.designation.name,
#             'profile_image': profile.profile_image,
#             'downlines': data
#         }

# class TodayDownlineList(generics.RetrieveAPIView):
#     serializer_class = DownlineSerializer
#     queryset = Profile.objects.all()
#     authentication_classes = (TokenAuthentication, SessionAuthentication,)

#     def get_object(self):
#         pk = self.kwargs.get('member_pk')
#         q = self.kwargs.get('q')
#         profile = self.get_queryset().filter(pk=pk)[0]
#         members = profile.group.members.all()
#         group = Group(members)
#         data = None
#         if q == 'epf':
#             data = group.today_epf()
#         elif q == 'cash':
#             data = group.today_cash()
#         elif q == 'asb':
#             data = group.today_asb()
#         elif q == 'prs':
#             data = group.today_prs()
#         else:
#             data = group.today_total()
#         return {
#             'pk': profile.pk,
#             'name': profile.name,
#             'designation': profile.designation.name,
#             'profile_image': profile.profile_image,
#             'downlines': data
#         }
