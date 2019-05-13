from datetime import timedelta
from django.utils import timezone
from django.db.models import Q

class SalesFilter:

    sales = None
    status = None
    sales_type = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, sales, period, sales_type, status, date_from, date_until):
        self.sales = sales
        if period != 'all':
            self.period = period
        if sales_type != 'all':
            self.sales_type = sales_type
        if status != 'all':
            self.status = status
        if date_from is not None:
            self.date_from = date_from
            self.date_until = date_until

    def period_filter(self):
        if self.period == 'year':
            return self.sales.filter(timestamp__year=timezone.now().year)
        elif self.period == 'month':
            return self.sales.filter(timestamp__month=timezone.now().month)
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now() - timedelta(days=day)
            end = timezone.now() + timedelta(days=6 - day)
            return self.sales.filter(timestamp__range=(start, end))
        elif self.period == 'today':
            return self.sales.filter(timestamp__date=timezone.now().date())
        elif self.period == 'select date':
            return self.sales.filter(timestamp__range=(self.date_from, self.date_until))
        return self.sales.all()
    
    def sales_type_status_filter(self):
        period = self.period_filter()
        if self.sales_type is not None and self.status is not None:
            return period.filter(
                Q(sales_type__name=self.sales_type) &
                Q(sales_status__name=self.status)
            )
        elif self.sales_type is not None:
            return period.filter(sales_type__name=self.sales_type)
        elif self.status is not None:
            return period.filter(sales_status__name=self.status)
        return period

    def result(self):
        return self.sales_type_status_filter().order_by('-timestamp')