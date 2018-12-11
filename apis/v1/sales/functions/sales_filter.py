from datetime import timedelta
from django.utils import timezone
import pytz

class SalesFilter:

    sales = None
    now = timezone.now()

    def __init__(self, sales):
        self.sales = sales.order_by('-timestamp')
    
    def period(self, sales):
        today = self.now.astimezone(pytz.timezone('Asia/Kuala_Lumpur'))
        day = today.weekday()
        start = today - timedelta(days=day)
        end = today + timedelta(days=6 - day)
        return {
            'year': sales.filter(timestamp__year=self.now.year),
            'month': sales.filter(timestamp__month=self.now.month),
            'week': sales.filter(timestamp__range=(start, end)),
            'today': sales.filter(timestamp__date=self.now.date())
        }
    
    def total(self, p):
        result = None
        if p == 'month':
            result = self.period(self.sales)['month']
        elif p == 'week':
            result = self.period(self.sales)['month']
        elif p == 'today':
            result = self.period(self.sales)['month']
        else:
            result = self.period(self.sales)['year']
        return result
    
    def epf(self, p):
        sales = self.sales.filter(sales_type__name='EPF')
        result = None
        if p == 'month':
            result = self.period(sales)['month']
        elif p == 'week':
            result = self.period(sales)['month']
        elif p == 'today':
            result = self.period(sales)['month']
        else:
            result = self.period(sales)['year']
        return result

    def cash(self, p):
        sales = self.sales.filter(sales_type__name='Cash')
        result = None
        if p == 'month':
            result = self.period(sales)['month']
        elif p == 'week':
            result = self.period(sales)['month']
        elif p == 'today':
            result = self.period(sales)['month']
        else:
            result = self.period(sales)['year']
        return result

    def asb(self, p):
        sales = self.sales.filter(sales_type__name='ASB')
        result = None
        if p == 'month':
            result = self.period(sales)['month']
        elif p == 'week':
            result = self.period(sales)['month']
        elif p == 'today':
            result = self.period(sales)['month']
        else:
            result = self.period(sales)['year']
        return result

    def prs(self, p):
        sales = self.sales.filter(sales_type__name='PRS')
        result = None
        if p == 'month':
            result = self.period(sales)['month']
        elif p == 'week':
            result = self.period(sales)['month']
        elif p == 'today':
            result = self.period(sales)['month']
        else:
            result = self.period(sales)['year']
        return result