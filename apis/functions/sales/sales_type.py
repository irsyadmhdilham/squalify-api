from functools import reduce
from .income import Income

class SalesType:
    sales = None

    def __init__(self, sales):
        self.sales = sales

    def EPF(self):
        total = '0.00'
        sales = self.sales.filter(sales_type__name='EPF')
        if sales.count() > 0:
            amount = map(lambda val: val.amount, sales)
            total = str(reduce(lambda a, b: a + b, amount))
        return total
    
    def Cash(self):
        total = '0.00'
        sales = self.sales.filter(sales_type__name='Cash')
        if sales.count() > 0:
            amount = map(lambda val: val.amount, sales)
            total = str(reduce(lambda a, b: a + b, amount))
        return total

    def ASB(self):
        total = '0.00'
        sales = self.sales.filter(sales_type__name='ASB')
        if sales.count() > 0:
            amount = map(lambda val: val.amount, sales)
            total = str(reduce(lambda a, b: a + b, amount))
        return total

    def PRS(self):
        total = '0.00'
        sales = self.sales.filter(sales_type__name='PRS')
        if sales.count() > 0:
            amount = map(lambda val: val.amount, sales)
            total = str(reduce(lambda a, b: a + b, amount))
        return total

    def Total(self):
        total = '0.00'
        if self.sales.count() > 0:
            amount = map(lambda val: val.amount, self.sales)
            total = str(reduce(lambda a, b: a + b, amount))
        return total

class Serializer(SalesType):
    designation = None
    comm_struct = None
    company = None


    def __init__(self, sales, designation, company, comm_struct):
        super().__init__(sales)
        self.comm_struct = comm_struct
        self.company = company
        self.designation = designation

    def personal(self):
        epf = Income(self.comm_struct, self.Total(), self.designation, self.company, 'EPF').self_income()
        cash = Income(self.comm_struct, self.Total(), self.designation, self.company, 'Cash').self_income()
        if self.company == 'Public Mutual':
            return {
                'Total': {
                    'sales': self.Total(),
                    'income': str(round(cash + epf, 2))
                }
            }
        else:
            return {
                'EPF': self.EPF(),
                'Cash': self.Cash(),
                'PRS': self.PRS(),
                'ASB': self.ASB(),
                'Total': self.Total()
            }