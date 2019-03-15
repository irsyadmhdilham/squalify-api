from datetime import timedelta
from dateutil import parser

class UpdateReminder:
    rd = None
    date = None
    
    def __init__(self, date, rd):
        self.rd = rd
        self.date = date
    
    def reminder(self):
        if self.rd == '30 minutes before':
            return self.date - timedelta(minutes=30)
        elif self.rd == 'An hour before':
            return self.date - timedelta(hours=1)
        elif self.rd == '2 hours before':
            return self.date - timedelta(hours=2)
        elif self.rd == 'A day before':
            return self.date - timedelta(days=1)
        elif self.rd == '2 days before':
            return self.date - timedelta(days=2)
        elif self.rd == 'A week before':
            return self.date - timedelta(weeks=1)
        else:
            return parser.parse(self.rd)