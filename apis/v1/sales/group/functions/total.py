from django.db.models import Sum
from django.utils import timezone
from datetime import timedelta

class TotalSales:

    members = None

    def __init__(self, members):
        self.members = members.all()
    
    def personal(self, member):
        return member.sales.aggregate(total=Sum('amount'))['total']
    
    def group(self, member):
        if member.group is not None:
            return member.group.members.aggregate(total=Sum('sales__amount'))['total']
        return None
    
    def downlines(self, member):
        if member.group is not None:
            return member.group.members.count()
        return None
    
    def map_function(self, member):
        return {
            'pk': member.pk,
            'name': member.name,
            'profile_image': member.profile_image,
            'personal': self.personal(member),
            'group': self.group(member),
            'downlines': self.downlines(member)
        }
    
    def result(self):
        return list(map(self.map_function, self.members))
