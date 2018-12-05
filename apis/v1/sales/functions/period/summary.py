from .year import Year
from .month import Month
from .week import Week
from .today import Today

class Summary(Year, Month, Week, Today):

    def __init__(self, members):
        super().__init__(members)

    def year(self, t):
        if t == 'epf':
            return self.year_sum_epf()
        elif t == 'cash':
            return self.year_sum_cash()
        elif t == 'asb':
            return self.year_sum_asb()
        elif t == 'prs':
            return self.year_sum_prs()
        else:
            return self.year_sum_total()
    
    def month(self, t):
        if t == 'epf':
            return self.month_sum_epf()
        elif t == 'cash':
            return self.month_sum_cash()
        elif t == 'asb':
            return self.month_sum_asb()
        elif t == 'prs':
            return self.month_sum_prs()
        else:
            return self.month_sum_total()

    def week(self, t):
        if t == 'epf':
            return self.week_sum_epf()
        elif t == 'cash':
            return self.week_sum_cash()
        elif t == 'asb':
            return self.week_sum_asb()
        elif t == 'prs':
            return self.week_sum_prs()
        else:
            return self.week_sum_total()

    def today(self, t):
        if t == 'epf':
            return self.today_sum_epf()
        elif t == 'cash':
            return self.today_sum_cash()
        elif t == 'asb':
            return self.today_sum_asb()
        elif t == 'prs':
            return self.today_sum_prs()
        else:
            return self.today_sum_total()
