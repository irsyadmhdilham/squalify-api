from django.db.models import Q
from datetime import date
from .serializer import Serializer

class Today(Serializer):

    def today_total(self):
        def profile(val):
            filter_sales = val.sales.filter(timestamp__date=date.today())
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def today_epf(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='EPF')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def today_cash(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='Cash')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def today_asb(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='ASB')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)

    def today_prs(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__date=date.today()) &
                Q(sales_type__name='PRS')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)