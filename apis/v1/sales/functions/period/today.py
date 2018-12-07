from django.db.models import Q
from datetime import date
from .serializer import Serializer
from functools import reduce

class Today(Serializer):

    members = None

    def __init__(self, members):
        self.members = members

    def sort(self, val):
        return val['amount']

    def today_total(self):
        def profile(val):
            filter_sales = val.sales.filter(timestamp__date=date.today())
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def today_sum_total(self):
        amount = map(lambda val: val['amount'], self.today_total())
        return reduce(lambda a, b: a + b, amount)

    def today_epf(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='EPF')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def today_sum_epf(self):
        amount = map(lambda val: val['amount'], self.today_epf())
        return reduce(lambda a, b: a + b, amount)

    def today_cash(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='Cash')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def today_sum_cash(self):
        amount = map(lambda val: val['amount'], self.today_cash())
        return reduce(lambda a, b: a + b, amount)

    def today_asb(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='ASB')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def today_sum_asb(self):
        amount = map(lambda val: val['amount'], self.today_asb())
        return reduce(lambda a, b: a + b, amount)

    def today_prs(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='PRS')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        result = list(profiles)
        result.sort(key=self.sort, reverse=True)
        return result

    def today_sum_prs(self):
        amount = map(lambda val: val['amount'], self.today_prs())
        return reduce(lambda a, b: a + b, amount)