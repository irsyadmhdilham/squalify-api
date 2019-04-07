from django.utils import timezone
from datetime import timedelta
from dateutil.relativedelta import relativedelta

class PointPeriodFilter:

    members = None
    period = None

    def __init__(self, group, period):
        self.period = period
        self.members = group.members
    
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

    def __init__(self, group, period):
        super().__init__(group, period)
        self.members = group.members
        self.period = period
    
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

    def __init__(self, group, period):
        super().__init__(group, period)
        self.members = group.members
        self.period = period
    
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
        else:
            current = [sales for member in self.members.all() for sales in member.sales.filter(timestamp__year=timezone.now().year)]
        return current

class ConsultantsFilter(SalesPeriodFilter):

    members = None
    period = None

    def __init__(self, group, period):
        super().__init__(group, period)
        self.members = group.members
        self.period = period
    
    def consultant_period_output(self):
        if self.period == 'month':
            return self.members.filter(points__date__month=timezone.now().month).distinct()
        elif self.period == 'week':
            day = timezone.now().weekday()
            start = timezone.now().date() - timedelta(days=day)
            end = timezone.now().date() + timedelta(days=6 - day)
            return self.members.filter(points__date__range=(start, end)).distinct()
        elif self.period == 'today':
            return self.members.filter(points__date__date=timezone.now().date()).distinct()
        else:
            return self.members.filter(points__date__year=timezone.now().year).distinct()

class PeriodFilter(ConsultantsFilter):
    
    def __init__(self, group, period):
        super().__init__(group, period)