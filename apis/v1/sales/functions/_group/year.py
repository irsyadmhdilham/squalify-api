from django.db.models import Q
from datetime import date
from .serializer import Serializer

class Year(Serializer):

    current_year = date.today().year
    members = None

    def __init__(self, members):
        self.members = members

    def year_total(self):
        def profile(val):
            filter_sales = val.sales.filter(timestamp__year=self.current_year)
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)
    
    def year_epf(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='EPF')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)
    
    def year_cash(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='Cash')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)
    
    def year_asb(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='ASB')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)
    
    def year_prs(self):
        def profile(val):
            filter_sales = val.sales.filter(
                Q(timestamp__year=self.current_year) &
                Q(sales_type__name='PRS')
            )
            return self.profile_serializer(val, filter_sales)
        profiles = map(profile, self.members)
        return list(profiles)