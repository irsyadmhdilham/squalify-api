from django.db.models import Sum, Q
from django.utils import timezone
from datetime import timedelta
from .total import TotalSales

class SalesFilter(TotalSales):

    members = None
    period = None
    sales_type = None
    status = None
    
    def __init__(self, period, sales_type, status, members):
        self.members = members.all()
        if period != 'all':
            self.period = period
        if sales_type != 'all':
            self.sales_type = sales_type
        if status != 'all':
            self.status = status
    
    def personal_period_filter(self, member):
        if self.period == 'year':
            return member.sales.filter(timestamp__year=timezone.now().year)
        elif self.period == 'month':
            return member.sales.filter(timestamp__month=timezone.now().month)
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now() - timedelta(days=day)
            end = timezone.now() + timedelta(days=6 - day)
            return member.sales.filter(timestamp__range=(start, end))
        elif self.period == 'today':
            return member.sales.filter(timestamp__date=timezone.now().date())
        else:
            return member.sales.all()
    
    def group_period_filter(self, member):
        if member.group is not None:
            if self.period == 'year':
                sales = map(lambda val: val.sales.filter(timestamp__year=timezone.now().year), member.group.members.all())
                return list(sales)[0]
            elif self.period == 'month':
                sales = map(lambda val: val.sales.filter(timestamp__month=timezone.now().month), member.group.members.all())
                return list(sales)[0]
            elif self.period == 'week':
                day = timezone.now().weekday()
                start = timezone.now() - timedelta(days=day)
                end = timezone.now() + timedelta(days=6 - day)
                sales = map(lambda val: val.sales.filter(timestamp__range=(start, end)), member.group.members.all())
                return list(sales)[0]
            elif self.period == 'today':
                sales = map(lambda val: val.sales.filter(timestamp__date=timezone.now().date()), member.group.members.all())
                return list(sales)[0]
            else:
                sales = map(lambda val: val.sales.all(), member.group.members.all())
                return list(sales)[0]
        else:
            return None

    def personal_filter(self, member):
        if self.sales_type is not None and self.status is not None:
            return self.personal_period_filter(member).filter(
                Q(sales_type__name=self.sales_type) &
                Q(sales_status__name=self.status)
            )
        elif self.sales_type is not None:
            return self.personal_period_filter(member).filter(sales_type__name=self.sales_type)
        elif self.status is not None:
            return self.personal_period_filter(member).filter(sales_status__name=self.status)
        else:
            return self.personal_period_filter(member)
    
    def group_filter(self, member):
        period_filter = self.group_period_filter(member)
        if period_filter is not None:
            if self.sales_type is not None and self.status is not None:
                return period_filter.filter(
                    Q(sales_type__name=self.sales_type) &
                    Q(sales_status__name=self.status)
                )
            elif self.sales_type is not None:
                return period_filter.filter(sales_type__name=self.sales_type)
            elif self.status is not None:
                return period_filter.filter(sales_status__name=self.status)
            else:
                return period_filter
        else:
            return None

    def personal_total(self, member):
        sales = self.personal_filter(member)
        total = sales.aggregate(total=Sum('amount'))['total']
        if total is not None:
            return total
        return 0
    
    def group_total(self, member):
        sales = self.group_filter(member)
        if sales is not None:
            total = sales.aggregate(total=Sum('amount'))['total']
            if total is not None:
                return total
            return 0
        else:
            return 0

    def map_function(self, member):
        return {
            'pk': member.pk,
            'name': member.name,
            'profile_image': member.profile_image,
            'personal': self.personal_total(member),
            'group': self.group_total(member),
            'downlines': self.downlines(member)
        }
    
    def result(self):
        return list(map(self.map_function, self.members))