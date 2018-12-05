from ._group.year import Year
from ._group.month import Month
from ._group.week import Week
from ._group.today import Today

class Group(Year, Month, Week, Today):

    def __init__(self, members):
        super().__init__(members)