from django.utils import timezone
from datetime import timedelta

class PointPeriodFilter:

    points = None
    period = None

    def __init__(self, profile, period):
        self.points = profile.points
        self.period = period
    
    def period_output(self):
        if self.period == 'month':
            previous = timezone.now() - timedelta(months=1)
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
        else:
            return {
                'current': self.points.filter(date__year=timezone.now().year),
                'previous': self.points.filter(date__year=timezone.now().year - 1)
            }

class ContactPeriodFilter:

    contacts = None
    period = None

    def __init__(self, profile, period):
        self.contacts = profile.contacts
        self.period = period
    
    def contact_period_output(self):
        if self.period == 'month':
            previous = timezone.now() - timedelta(months=1)
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
                'current': self.points.filter(created_on__date=timezone.now().date()),
                'previous': self.points.filter(created_on__date=previous.date())
            }
        else:
            return {
                'current': self.points.filter(created_on__year=timezone.now().year),
                'previous': self.points.filter(created_on__year=timezone.now().year - 1)
            }
