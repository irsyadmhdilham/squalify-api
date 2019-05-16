from django.utils import timezone
from datetime import timedelta
from dateutil.relativedelta import relativedelta
from dateutil import parser

class PointPeriodFilter:

    points = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, profile, period, date_from, date_until):
        self.points = profile.points
        self.period = period
        self.date_from = date_from
        self.date_until = date_until
    
    def period_output(self):
        if self.period == 'month':
            previous = timezone.now() - relativedelta(months=1)
            return {
                'current': self.points.filter(date__month=timezone.now().month),
                'previous': self.points.filter(date__month=previous.month)
            }
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            previous_start = start - timedelta(weeks=1)
            end = timezone.now().date() + timedelta(days=6 - day)
            previous_end = end - timedelta(weeks=1)
            return {
                'current': self.points.filter(date__range=(start, end)),
                'previous': self.points.filter(date__range=(previous_start, previous_end))
            }
        elif self.period == 'today':
            previous = timezone.now() - timedelta(days=1)
            return {
                'current': self.points.filter(date=timezone.now().date()),
                'previous': self.points.filter(date=previous.date())
            }
        elif self.period == 'select date':
            days_diff = (self.date_until - self.date_from).days
            pre_from = self.date_from - timedelta(days=days_diff)
            pre_until = self.date_until - timedelta(days=days_diff)
            return {
                'current': self.points.filter(date__range=(self.date_from, self.date_until)),
                'previous': self.points.filter(date__range=(pre_from, pre_until))
            }
        else:
            return {
                'current': self.points.filter(date__year=timezone.now().year),
                'previous': self.points.filter(date__year=timezone.now().year - 1)
            }

class ContactPeriodFilter(PointPeriodFilter):

    contacts = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, profile, period, date_from, date_until):
        super().__init__(profile, period, date_from, date_until)
        self.contacts = profile.contacts
        self.period = period
        self.date_from = date_from
        self.date_until = date_until
    
    def contact_period_output(self):
        if self.period == 'month':
            previous = timezone.now() - relativedelta(months=1)
            return {
                'current': self.contacts.filter(created_on__month=timezone.now().month),
                'previous': self.contacts.filter(created_on__month=previous.month)
            }
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            previous_start = start - timedelta(weeks=1)
            end = timezone.now().date() + timedelta(days=6 - day)
            previous_end = end - timedelta(weeks=1)
            return {
                'current': self.contacts.filter(created_on__range=(start, end)),
                'previous': self.contacts.filter(created_on__range=(previous_start, previous_end))
            }
        elif self.period == 'today':
            previous = timezone.now() - timedelta(days=1)
            return {
                'current': self.contacts.filter(created_on__date=timezone.now().date()),
                'previous': self.contacts.filter(created_on__date=previous.date())
            }
        elif self.period == 'select date':
            days_diff = (self.date_until - self.date_from).days
            pre_from = self.date_from - timedelta(days=days_diff)
            pre_until = self.date_until - timedelta(days=days_diff)
            return {
                'current': self.contacts.filter(created_on__range=(self.date_from, self.date_until)),
                'previous': self.contacts.filter(created_on__range=(pre_from, pre_until))
            }
        else:
            return {
                'current': self.contacts.filter(created_on__year=timezone.now().year),
                'previous': self.contacts.filter(created_on__year=timezone.now().year - 1)
            }

class SalesPeriodFilter(ContactPeriodFilter):

    sales = None
    period = None
    date_from = None
    date_until = None

    def __init__(self, profile, period, date_from, date_until):
        super().__init__(profile, period, date_from, date_until)
        self.sales = profile.sales
        self.period = period
        self.date_from = date_from
        self.date_until = date_until
    
    def sales_period_output(self):
        if self.period == 'month':
            previous = timezone.now() - relativedelta(months=1)
            return self.sales.filter(timestamp__month=timezone.now().month)
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            end = timezone.now().date() + timedelta(days=6 - day)
            return self.sales.filter(timestamp__range=(start, end))
        elif self.period == 'today':
            previous = timezone.now() - timedelta(days=1)
            return self.sales.filter(timestamp__date=timezone.now().date())
        elif self.period == 'select date':
            return self.sales.filter(timestamp__range=(self.date_from, self.date_until))
        else:
            return self.sales.filter(timestamp__year=timezone.now().year)

class PeriodFilter(SalesPeriodFilter):
    
    def __init__(self, profile, period, date_from, date_until):
        if period == 'select date':
            date_from = parser.parse(date_from)
            date_until = parser.parse(date_until)
        super().__init__(profile, period, date_from, date_until)

