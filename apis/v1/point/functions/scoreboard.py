from datetime import date, timedelta
from django.db.models import Sum, Q

class Scoreboard:

    members = None

    def __init__(self, members):
        self.members = members
    
    def point_sum(self, points):
        point = points.values('attributes__point').aggregate(total=Sum('attributes__point'))
        total = 0
        if point['total'] is not None:
            total = point['total']
        return total
    
    def year(self):
        def profile(val):
            filter_points = val.points.filter(date__year=date.today().year)
            return {
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        return list(profiles)
    
    def month(self):
        def profile(val):
            filter_points = val.points.filter(Q(date__month=date.today().month) & Q(date__year=date.today().year))
            return {
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        return list(profiles)

    def today(self):
        def profile(val):
            filter_points = val.points.filter(date=date.today())
            return {
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        return list(profiles)

    def week(self):
        def profile(val):
            today = date.today()
            day = today.weekday()
            start = today - timedelta(days=day)
            end = today + timedelta(days=6 - day)
            filter_points = val.points.filter(date__range=(start, end))
            return {
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        return list(profiles)