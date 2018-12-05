from django.db.models import Q
from datetime import date
from .serializer import Serializer

class Month(Serializer):

    def month_total(self):
        def profile(val):
            current_year = date.today().year
            current_month = date.today().month
            filter_sales = val.sales.filter(
                Q(timestamp__year=current_year) &
                Q(timestamp__month=current_month)
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)
    
    def month_epf(self):
        def profile(val):
            current_year = date.today().year
            current_month = date.today().month
            filter_sales = val.sales.filter(
                Q(timestamp__year=current_year) &
                Q(timestamp__month=current_month) &
                Q(sales_type__name='EPF')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def month_cash(self):
        def profile(val):
            current_year = date.today().year
            current_month = date.today().month
            filter_sales = val.sales.filter(
                Q(timestamp__year=current_year) &
                Q(timestamp__month=current_month) &
                Q(sales_type__name='Cash')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def month_asb(self):
        def profile(val):
            current_year = date.today().year
            current_month = date.today().month
            filter_sales = val.sales.filter(
                Q(timestamp__year=current_year) &
                Q(timestamp__month=current_month) &
                Q(sales_type__name='ASB')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def month_prs(self):
        def profile(val):
            current_year = date.today().year
            current_month = date.today().month
            filter_sales = val.sales.filter(
                Q(timestamp__year=current_year) &
                Q(timestamp__month=current_month) &
                Q(sales_type__name='PRS')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)