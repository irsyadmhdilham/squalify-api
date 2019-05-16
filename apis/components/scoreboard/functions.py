from django.utils import timezone
from django.db.models import Q, Sum
from datetime import timedelta
from operator import itemgetter

class SalesFilter:
    members = None
    period = None
    sales_type = None
    date_from = None
    date_until = None
    
    def __init__(self, members, period, sales_type, date_from, date_until):
        self.members = members.all()
        self.date_from = date_from
        self.date_until = date_until
        # if period != 'all' and period != 'period':
        self.period = period
        # if sales_type != 'all' and period != 'sales type':
        self.sales_type = sales_type

    def select_date(self, sales):
        output = sales.filter(timestamp__range=(self.date_from, self.date_until))
        if self.sales_type is not None:
            output = sales.filter(
                Q(timestamp__range=(self.date_from, self.date_until)) &
                Q(sales_type__name=self.sales_type)
            )
        total = output.aggregate(total=Sum('amount'))['total']
        if total is not None:
            return total
        return 0
    
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
        elif self.period == 'select date':
            return self.select_date(sales)
        else:
            total = sales.aggregate(total=Sum('amount'))['total']
            if total is not None:
                return total
            return 0
    
    def mapper(self, member):
        return {
            'pk': member.pk,
            'name': member.name,
            'designation': member.designation,
            'profile_image': member.profile_image,
            'amount': self.amount(member.sales)
        }
    
    def result(self):
        output = filter(lambda val: val['designation'].name != 'Group Agency Manager', map(self.mapper, self.members))
        return self.sort(output)
    
    def sort(self, output):
        return sorted(output, key=itemgetter('amount'), reverse=True)