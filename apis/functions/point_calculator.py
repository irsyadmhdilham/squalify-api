from apis._models.profile import Profile
from datetime import datetime
from functools import reduce

class PointCalculator:
    attribute: None
    today_points: None
    user_pk = None

    def __init__(self, user_pk, attribute):
        self.attribute = attribute
        self.user_pk = user_pk
        points = Profile.objects.get(pk=user_pk).points.filter(date=datetime.now().date())
        if points.count() > 0:
            self.today_points = points[0]

    def today_pk(self):
        return self.today_points.pk

    def today_total(self):
        pk = None
        total = 0
        if self.today_points is not None:
            attributes = self.today_points.attributes.all()
            attr = list(filter(lambda val: val.attribute.name == self.attribute, attributes))
            if len(attr) > 0:
                pk = attr[0].pk
                total = reduce(lambda a, b: a + b, map(lambda val: val.point, attr))
        return {
            'pk': pk,
            'total': total
        }


