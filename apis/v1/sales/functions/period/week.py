from .serializer import Serializer
from django.db.models import Q
from datetime import datetime, timedelta
import pytz
from functools import reduce

class Week(Serializer):

    def week_total(self):
        today = datetime.now().astimezone(pytz.timezone('Asia/Kuala_Lumpur'))
        day = today.weekday()
        start = today - timedelta(days=day)
        end = today + timedelta(days=6 - day)
        def profile(val):
            filter_sales = val.sales.filter(timestamp__range=(start, end))
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def week_sum_total(self):
        amount = map(lambda val: val['amount'], self.week_total())
        return reduce(lambda a, b: a + b, amount)

    def week_epf(self):
        today = datetime.now().astimezone(pytz.timezone('Asia/Kuala_Lumpur'))
        day = today.weekday()
        start = today - timedelta(days=day)
        end = today + timedelta(days=6 - day)
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__range=(start, end)) &
                Q(sales_type__name='EPF')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def week_sum_epf(self):
        amount = map(lambda val: val['amount'], self.week_epf())
        return reduce(lambda a, b: a + b, amount)

    def week_cash(self):
        today = datetime.now().astimezone(pytz.timezone('Asia/Kuala_Lumpur'))
        day = today.weekday()
        start = today - timedelta(days=day)
        end = today + timedelta(days=6 - day)
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__range=(start, end)) &
                Q(sales_type__name='Cash')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def week_sum_cash(self):
        amount = map(lambda val: val['amount'], self.week_cash())
        return reduce(lambda a, b: a + b, amount)

    def week_asb(self):
        today = datetime.now().astimezone(pytz.timezone('Asia/Kuala_Lumpur'))
        day = today.weekday()
        start = today - timedelta(days=day)
        end = today + timedelta(days=6 - day)
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__range=(start, end)) &
                Q(sales_type__name='ASB')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def week_sum_asb(self):
        amount = map(lambda val: val['amount'], self.week_asb())
        return reduce(lambda a, b: a + b, amount)

    def week_prs(self):
        today = datetime.now().astimezone(pytz.timezone('Asia/Kuala_Lumpur'))
        day = today.weekday()
        start = today - timedelta(days=day)
        end = today + timedelta(days=6 - day)
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__range=(start, end)) &
                Q(sales_type__name='PRS')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)
    
    def week_sum_prs(self):
        amount = map(lambda val: val['amount'], self.week_prs())
        return reduce(lambda a, b: a + b, amount)