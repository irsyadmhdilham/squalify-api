from .period.month import Month
from .period.week import Week
from .period.today import Today
from .period.year import Year

class Group(Year, Month, Week, Today):

    def __init__(self, members):
        super().__init__(members)