from django.db.models import Q
from datetime import date
from .serializer import Serializer
from functools import reduce

class Month(Serializer):

    members = None

    def __init__(self, members):
        self.members = members

    def sort(self, val):
        return val['amount']

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
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def month_sum_total(self):
        amount = map(lambda val: val['amount'], self.month_total())
        return reduce(lambda a, b: a + b, amount)
    
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
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def month_sum_epf(self):
        amount = map(lambda val: val['amount'], self.month_epf())
        return reduce(lambda a, b: a + b, amount)

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
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def month_sum_cash(self):
        amount = map(lambda val: val['amount'], self.month_cash())
        return reduce(lambda a, b: a + b, amount)

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
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def month_sum_asb(self):
        amount = map(lambda val: val['amount'], self.month_asb())
        return reduce(lambda a, b: a + b, amount)

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
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def month_sum_prs(self):
        amount = map(lambda val: val['amount'], self.month_prs())
        return reduce(lambda a, b: a + b, amount)