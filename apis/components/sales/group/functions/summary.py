from django.utils import timezone
from django.db.models import Sum, Q
from datetime import timedelta

class Status:

    sales_type = None

    def __init__(self, sales_type):
        if sales_type != 'all' and sales_type != 'sales type':
            self.sales_type = sales_type
    
    def status_type_filter(self, sales, sales_status, sales_type=False):
        if sales_type:
            def sales_filter(val):
                cond_a = val.sales_status.name == sales_status
                cond_b = val.sales_type.name == self.sales_type
                return cond_a and cond_b
            return list(filter(sales_filter, sales))

        def sales_filter(val):
            return val.sales_status.name == sales_status
        return list(filter(sales_filter, sales))

    def in_hand(self, sales):
        if len(sales) > 0:
            filtered_sales = self.status_type_filter(sales, 'In hand')
            if self.sales_type is not None:
                filtered_sales = self.status_type_filter(sales, 'In hand', True)
            if len(filtered_sales) > 0:
                x = 0
                for s in filtered_sales:
                    x += s.amount
                return { 'cases': len(filtered_sales), 'total': x }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }

    def submitted(self, sales):
        if len(sales) > 0:
            filtered_sales = self.status_type_filter(sales, 'Submitted')
            if self.sales_type is not None:
                filtered_sales = self.status_type_filter(sales, 'Submitted', True)
            if len(filtered_sales) > 0:
                x = 0
                for s in filtered_sales:
                    x += s.amount
                return { 'cases': len(filtered_sales), 'total': x }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }

    def rejected(self, sales):
        if len(sales) > 0:
            filtered_sales = self.status_type_filter(sales, 'Rejected')
            if self.sales_type is not None:
                filtered_sales = self.status_type_filter(sales, 'Rejected', True)
            if len(filtered_sales) > 0:
                x = 0
                for s in filtered_sales:
                    x += s.amount
                return { 'cases': len(filtered_sales), 'total': x }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }

    def disburst(self, sales):
        if len(sales) > 0:
            filtered_sales = self.status_type_filter(sales, 'Disburst')
            if self.sales_type is not None:
                filtered_sales = self.status_type_filter(sales, 'Disburst', True)
            if len(filtered_sales) > 0:
                x = 0
                for s in filtered_sales:
                    x += s.amount
                return { 'cases': len(filtered_sales), 'total': x }
            return { 'cases': 0, 'total': 0 }
        return { 'cases': 0, 'total': 0 }
    
    def status_serializer(self, sales):
        return {
            'in_hand': self.in_hand(sales),
            'submitted': self.submitted(sales),
            'disburst': self.disburst(sales),
            'rejected': self.rejected(sales)
        }

class Summary(Status):

    members = None
    period = None
    date_from = None
    date_until = None
    
    def __init__(self, sales_type, members, period, date_from, date_until):
        self.members = members.all()
        self.period = period
        self.date_from = date_from
        self.date_until = date_until
        super().__init__(sales_type)

    # def year(self):
    #     sales = [sales for member in self.members for sales in member.sales.filter(timestamp__year=timezone.now().year)]
    #     return self.status_serializer(sales)

    # def month(self):
    #     sales = [sales for member in self.members for sales in member.sales.filter(timestamp__month=timezone.now().month)]
    #     return self.status_serializer(sales)

    # def week(self):
    #     day = timezone.now().weekday()
    #     start = timezone.now() - timedelta(days=day)
    #     end = timezone.now() + timedelta(days=6 - day)
    #     sales = [sales for member in self.members for sales in member.sales.filter(timestamp__range=(start, end))]
    #     return self.status_serializer(sales)

    # def today(self):
    #     sales = [sales for member in self.members for sales in member.sales.filter(timestamp__date=timezone.now().date())]
    #     return self.status_serializer(sales)

    def all_sales(self):
        sales = [sales for member in self.members for sales in member.sales.all()]
        return self.status_serializer(sales)
    
    def select_date(self):
        sales = [sales for member in self.members for sales in member.sales.filter(timestamp__range=(self.date_from, self.date_until))]
        return self.status_serializer(sales)

    def result(self):
        if self.period == 'select date':
            return self.select_date()
        else:
            return self.all_sales()