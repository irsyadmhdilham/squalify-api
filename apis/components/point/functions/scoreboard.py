from datetime import timedelta
from django.utils import timezone
from django.db.models import Sum, Q
from dateutil import parser

class Scoreboard:

    members = None

    def __init__(self, members):
        self.members = members.exclude(designation__name='Group Agency Manager')
    
    def sort(self, val):
        return val['point']
    
    def point_sum(self, points):
        point = points.values('attributes__point').aggregate(total=Sum('attributes__point'))
        total = 0
        if point['total'] is not None:
            total = point['total']
        return total
    
    def select_date(self, sort, date_from, date_until):
        date_from = parser.parse(date_from).date()
        date_until = parser.parse(date_until).date()
        def profile(val):
            filter_points = val.points.filter(date__range=(date_from, date_until))
            return {
                'pk': val.pk,
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        result = list(profiles)
        if sort:
            result.sort(key=self.sort, reverse=True)
        return result
    
    def year(self, sort):
        def profile(val):
            filter_points = val.points.filter(date__year=timezone.now().date().year)
            return {
                'pk': val.pk,
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        result = list(profiles)
        if sort:
            result.sort(key=self.sort, reverse=True)
        return result
    
    def month(self, sort):
        def profile(val):
            date = timezone.now().date()
            filter_points = val.points.filter(Q(date__month=date.month) & Q(date__year=date.year))
            return {
                'pk': val.pk,
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        result = list(profiles)
        if sort:
            result.sort(key=self.sort, reverse=True)
        return result

    def today(self, sort):
        def profile(val):
            filter_points = val.points.filter(date=timezone.now().date())
            return {
                'pk': val.pk,
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        result = list(profiles)
        if sort:
            result.sort(key=self.sort, reverse=True)
        return result

    def week(self, sort):
        def profile(val):
            today = timezone.now().today()
            day = today.weekday()
            start = today - timedelta(days=day)
            end = today + timedelta(days=6 - day)
            filter_points = val.points.filter(date__range=(start, end))
            return {
                'pk': val.pk,
                'name': val.name,
                'designation': val.designation.name,
                'profile_image': val.profile_image,
                'point': self.point_sum(filter_points)
            }
        profiles = map(profile, self.members)
        result = list(profiles)
        if sort:
            result.sort(key=self.sort, reverse=True)
        return result