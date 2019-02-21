from datetime import timedelta
from dateutil import parser

class Reminder:
    duration = None
    date = None

    def __init__(self, date, duration):
        self.date = date
        self.duration = duration
    
    def reminder(self):
        if self.duration == '30 minutes before':
            return self.date - timedelta(minutes=30)
        elif self.duration == 'An hour before':
            return self.date - timedelta(hours=1)
        elif self.duration == '2 hours before':
            return self.date - timedelta(hours=2)
        elif self.duration == 'A day before':
            return self.date - timedelta(days=1)
        elif self.duration == '2 days before':
            return self.date - timedelta(days=2)
        elif self.duration == 'A week before':
            return self.date - timedelta(weeks=1)
        else:
            return parser.parse(self.duration)