from django.db.models import Q, Sum
from datetime import timedelta
from django.utils import timezone
from .income import Income
import pytz

class SalesType:

    comm_struct = None
    designation = None
    company = None

    def __init__(self, comm_struct, designation, company):
        self.comm_struct = comm_struct
        self.designation = designation
        self.company = company
    
    def income(self, sales):
        epf = Income(self.comm_struct, float(self.epf(sales)), self.designation, self.company, 'EPF')
        cash = Income(self.comm_struct, float(self.cash(sales)), self.designation, self.company, 'Cash')
        # return epf.self_income() + cash.self_income()
        return '21000.00'
    
    def total(self, sales):
        amount = sales.aggregate(total=Sum('amount'))
        result = amount['total']
        if result is None:
            return 0
        return result

    def cash(self, sales):
        amount = sales.filter(sales_type__name='Cash').aggregate(total=Sum('amount'))
        total = amount['total']
        if total is None:
            return 0
        return total
    
    def epf(self, sales):
        amount = sales.filter(sales_type__name='EPF').aggregate(total=Sum('amount'))
        total = amount['total']
        if total is None:
            return 0
        return total
    
    def asb(self, sales):
        amount = sales.filter(sales_type__name='ASB').aggregate(total=Sum('amount'))
        total = amount['total']
        if total is None:
            return 0
        return total
    
    def prs(self, sales):
        amount = sales.filter(sales_type__name='PRS').aggregate(total=Sum('amount'))
        total = amount['total']
        if total is None:
            return 0
        return total

class Personal(SalesType):

    sales = None
    now = timezone.now()

    def __init__(self, sales, comm_struct, designation, company):
        self.sales = sales
        super().__init__(comm_struct, designation, company)
    
    def serializer(self, sales):
        total = self.total(sales)
        cash = self.cash(sales)
        epf = self.epf(sales)
        asb = self.asb(sales)
        prs = self.prs(sales)
        income = self.income(sales)
        return {
            'epf': epf,
            'cash': cash,
            'prs': prs,
            'asb': asb,
            'total': total,
            'income': income
        }

    def year(self):
        year = self.now.year
        sales = self.sales.filter(timestamp__year=year)
        return self.serializer(sales)
    
    def month(self):
        year = self.now.year
        month = self.now.month
        sales = self.sales.filter(
            Q(timestamp__year=year) &
            Q(timestamp__month=month)
        )
        return self.serializer(sales)
    
    def week(self):
        today = self.now.astimezone(pytz.timezone('Asia/Kuala_Lumpur'))
        day = today.weekday()
        start = today - timedelta(days=day)
        end = today + timedelta(days=6 - day)
        sales = self.sales.filter(timestamp__range=(start, end))
        return self.serializer(sales)
    
    def today(self):
        sales = self.sales.filter(timestamp__date=self.now.date())
        return self.serializer(sales)