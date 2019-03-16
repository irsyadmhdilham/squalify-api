from django.utils import timezone
from django.db.models import Sum
from datetime import timedelta

class Status:

    sales_type = None

    def __init__(self, sales_type):
        self.sales_type = sales_type
    
    def sales_type_filter(self, sales):
        if self.sales_type is not None:
            return sales.filter(sales_type__name=self.sales_type)
        return sales
    
    def in_hand(self, sales):
        in_hand = self.sales_type_filter(sales).filter(sales_status__name='In hand')
        if in_hand.count() > 0:
            total = in_hand.aggregate(total=Sum('amount'))['total']
            if total is not None:
                return { 'cases': in_hand.count(), 'total': total }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }
    
    def submitted(self, sales):
        submitted = self.sales_type_filter(sales).filter(sales_status__name='Submitted')
        if submitted.count() > 0:
            total = submitted.aggregate(total=Sum('amount'))['total']
            if total is not None:
                return { 'cases': submitted.count(), 'total': total }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }
    
    def rejected(self, sales):
        rejected = self.sales_type_filter(sales).filter(sales_status__name='Rejected')
        if rejected.count() > 0:
            total = rejected.aggregate(total=Sum('amount'))['total']
            if total is not None:
                return { 'cases': rejected.count(), 'total': total }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }
    
    def disburst(self, sales):
        disburst = self.sales_type_filter(sales).filter(sales_status__name='Disburst')
        if disburst.count() > 0:
            total = disburst.aggregate(total=Sum('amount'))['total']
            if total is not None:
                return { 'cases': disburst.count(), 'total': total }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }
    
    def serializer(self, sales):
        return {
            'in_hand': self.in_hand(sales),
            'submitted': self.submitted(sales),
            'rejected': self.rejected(sales),
            'disburst': self.disburst(sales)
        }

class Summary(Status):
    sales = None

    def __init__(self, sales, sales_type):
        self.sales = sales
        st = None
        if sales_type != 'sales type' and sales_type != 'all':
            st = sales_type
        super().__init__(st)
    
    def year(self):
        sales = self.sales.filter(timestamp__year=timezone.now().year)
        return self.serializer(sales)

    def month(self):
        sales = self.sales.filter(timestamp__month=timezone.now().month)
        return self.serializer(sales)

    def week(self):
        day = timezone.now().weekday()
        start = timezone.now() - timedelta(days=day)
        end = timezone.now() + timedelta(days=6 - day)
        sales = self.sales.filter(timestamp__range=(start, end))
        return self.serializer(sales)

    def today(self):
        sales = self.sales.filter(timestamp__date=timezone.now().date())
        return self.serializer(sales)

    def result(self):
        return {
            'year': self.year(),
            'month': self.month(),
            'week': self.week(),
            'today': self.today()
        }