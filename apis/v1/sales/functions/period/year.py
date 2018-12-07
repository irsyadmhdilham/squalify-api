from django.db.models import Q
from datetime import date
from .serializer import Serializer
from functools import reduce

class Year(Serializer):

    current_year = date.today().year
    members = None

    def __init__(self, members):
        self.members = members
    
    def sort(self, val):
        return val['amount']

    def year_total(self):
        def profile(val):
            filter_sales = val.sales.filter(timestamp__year=self.current_year)
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result
    
    def year_sum_total(self):
        amount = map(lambda val: val['amount'], self.year_total())
        return reduce(lambda a, b: a + b, amount)
    
    def year_epf(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='EPF')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def year_sum_epf(self):
        amount = map(lambda val: val['amount'], self.year_epf())
        return reduce(lambda a, b: a + b, amount)
    
    def year_cash(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='Cash')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def year_sum_cash(self):
        amount = map(lambda val: val['amount'], self.year_cash())
        return reduce(lambda a, b: a + b, amount)
    
    def year_asb(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='ASB')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def year_sum_asb(self):
        amount = map(lambda val: val['amount'], self.year_asb())
        return reduce(lambda a, b: a + b, amount)
    
    def year_prs(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='PRS')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def year_sum_prs(self):
        amount = map(lambda val: val['amount'], self.year_prs())
        return reduce(lambda a, b: a + b, amount)