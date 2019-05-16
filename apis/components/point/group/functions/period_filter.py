from django.utils import timezone
from datetime import timedelta
from dateutil.relativedelta import relativedelta
from dateutil import parser

class PointPeriodFilter:

    members = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, group, period, date_from, date_until):
        self.period = period
        self.members = group.members
        self.date_from = date_from
        self.date_until = date_until
    
    def period_output(self):
        if self.period == 'month':
            _previous = timezone.now() - relativedelta(months=1)

            current = [points for member in self.members.all() for points in member.points.filter(date__month=timezone.now().month)]
            previous = [points for member in self.members.all() for points in member.points.filter(date__month=_previous.month)]
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            previous_start = start - timedelta(weeks=1)
            end = timezone.now().date() + timedelta(days=6 - day)
            previous_end = end - timedelta(weeks=1)

            current = [points for member in self.members.all() for points in member.points.filter(date__range=(start, end))]
            previous = [points for member in self.members.all() for points in member.points.filter(date__range=(previous_start, previous_end))]
        elif self.period == 'today':
            _previous = timezone.now() - timedelta(days=1)

            current = [points for member in self.members.all() for points in member.points.filter(date=timezone.now().date())]
            previous = [points for member in self.members.all() for points in member.points.filter(date=_previous.date())]
        elif self.period == 'select date':
            days_diff = (self.date_until - self.date_from).days
            pre_from = self.date_from - timedelta(days=days_diff)
            pre_until = self.date_until - timedelta(days=days_diff)

            current = [points for member in self.members.all() for points in member.points.filter(date__range=(self.date_from, self.date_until))]
            previous = [points for member in self.members.all() for points in member.points.filter(date__range=(pre_from, pre_until))]
        else:
            current = [points for member in self.members.all() for points in member.points.filter(date__year=timezone.now().year)]
            previous = [points for member in self.members.all() for points in member.points.filter(date__year=timezone.now().year - 1)]

        return {
            'current': current,
            'previous': previous
        }

class ContactPeriodFilter(PointPeriodFilter):

    members = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, group, period, date_from, date_until):
        super().__init__(group, period, date_from, date_until)
        self.members = group.members
        self.period = period
        self.date_from = date_from
        self.date_until = date_until
    
    def contact_period_output(self):
        if self.period == 'month':
            _previous = timezone.now() - relativedelta(months=1)

            current = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__month=timezone.now().month)]
            previous = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__month=_previous.month)]
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            previous_start = start - timedelta(weeks=1)
            end = timezone.now().date() + timedelta(days=6 - day)
            previous_end = end - timedelta(weeks=1)

            current = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__range=(start, end))]
            previous = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__range=(previous_start, previous_end))]
        elif self.period == 'today':
            _previous = timezone.now() - timedelta(days=1)
            current = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__date=timezone.now().date())]
            previous = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__date=_previous.date())]
        elif self.period == 'select date':
            days_diff = (self.date_until - self.date_from).days
            pre_from = self.date_from - timedelta(days=days_diff)
            pre_until = self.date_until - timedelta(days=days_diff)

            current = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__range=(self.date_from, self.date_until))]
            previous = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__range=(pre_from, pre_until))]
        else:
            current = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__year=timezone.now().year)]
            previous = [contacts for member in self.members.all() for contacts in member.contacts.filter(created_on__year=timezone.now().year - 1)]
        
        return {
            'current': current,
            'previous': previous
        }

class SalesPeriodFilter(ContactPeriodFilter):

    members = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, group, period, date_from, date_until):
        super().__init__(group, period, date_from, date_until)
        self.members = group.members
        self.period = period
        self.date_from = date_from
        self.date_until = date_until
    
    def sales_period_output(self):
        if self.period == 'month':
            current = [sales for member in self.members.all() for sales in member.sales.filter(timestamp__month=timezone.now().month)]
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            end = timezone.now().date() + timedelta(days=6 - day)
            current = [sales for member in self.members.all() for sales in member.sales.filter(timestamp__range=(start, end))]
        elif self.period == 'today':
            current = [sales for member in self.members.all() for sales in member.sales.filter(timestamp__date=timezone.now().date())]
        elif self.period == 'select date':
            current = [sales for member in self.members.all() for sales in member.sales.filter(timestamp__range=(self.date_from, self.date_until))]
        else:
            current = [sales for member in self.members.all() for sales in member.sales.filter(timestamp__year=timezone.now().year)]
        return current

class ConsultantsFilter(SalesPeriodFilter):

    members = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, group, period, date_from, date_until):
        super().__init__(group, period, date_from, date_until)
        self.members = group.members
        self.period = period
        self.date_from = date_from
        self.date_until = date_until
    
    def consultant_period_output(self):
        if self.period == 'month':
            return self.members.filter(points__date__month=timezone.now().month).distinct()
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            end = timezone.now().date() + timedelta(days=6 - day)
            return self.members.filter(points__date__range=(start, end)).distinct()
        elif self.period == 'today':
            return self.members.filter(points__date=timezone.now().date()).distinct()
        elif self.period == 'select date':
            return self.members.filter(points__date__range=(self.date_from, self.date_until)).distinct()
        else:
            return self.members.filter(points__date__year=timezone.now().year).distinct()

class PeriodFilter(ConsultantsFilter):
    
    def __init__(self, group, period, date_from, date_until):
        if period == 'select date':
            date_from = parser.parse(date_from)
            date_until = parser.parse(date_until)
        super().__init__(group, period, date_from, date_until)