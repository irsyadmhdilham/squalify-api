from django.utils import timezone
from django.db.models import Q, Sum
from datetime import timedelta

class SalesFilter:
    members = None
    period = None
    sales_type = None
    
    def __init__(self, members, period, sales_type):
        self.members = members.all()
        if period != 'all':
            self.period = period
        if sales_type != 'all':
            self.sales_type = sales_type
    
    def year(self, sales):
        output = sales.filter(timestamp__year=timezone.now().year)
        if self.sales_type is not None:
            output = sales.filter(
                Q(timestamp__year=timezone.now().year) &
                Q(sales_type__name=self.sales_type)
            )
        total = output.aggregate(total=Sum('amount'))['total']
        if total is not None:
            return total
        return 0
    
    def month(self, sales):
        output = sales.filter(timestamp__month=timezone.now().month)
        if self.sales_type is not None:
            output = sales.filter(
                Q(timestamp__month=timezone.now().month) &
                Q(sales_type__name=self.sales_type)
            )
        total = output.aggregate(total=Sum('amount'))['total']
        if total is not None:
            return total
        return 0
    
    def week(self, sales):
        day = timezone.now().weekday()
        start = timezone.now() - timedelta(days=day)
        end = timezone.now() + timedelta(days=6 - day)
        output = sales.filter(timestamp__range=(start, end))
        if self.sales_type is not None:
            output = sales.filter(
                Q(timestamp__range=(start, end)) &
                Q(sales_type__name=self.sales_type)
            )
        total = output.aggregate(total=Sum('amount'))['total']
        if total is not None:
            return total
        return 0
    
    def today(self, sales):
        output = sales.filter(timestamp__date=timezone.now().date())
        if self.sales_type is not None:
            output = sales.filter(
                Q(timestamp__date=timezone.now().date()) &
                Q(sales_type__name=self.sales_type)
            )
        total = output.aggregate(total=Sum('amount'))['total']
        if total is not None:
            return total
        return 0
    
    def amount(self, sales):
        if self.period == 'year':
            return self.year(sales)
        elif self.period == 'month':
            return self.month(sales)
        elif self.period == 'week':
            return self.week(sales)
        elif self.period == 'today':
            return self.today(sales)
        else:
            total = sales.aggregate(total=Sum('amount'))['total']
            if total is not None:
                return total
            return 0
    
    def mapper(self, member):
        return {
            'pk': member.pk,
            'name': member.pk,
            'designation': member.designation,
            'profile_image': member.profile_image,
            'amount' self.amount(member.sales)
        }
    
    def result(self):
        return list(map(self.mapper, self.members))