class Income:
    amount = 0
    designation = None
    sales_type = None
    comm_struct = None
    company = None

    def __init__(self, comm_struct, amount, designation, company, sales_type):
        self.amount = amount
        if isinstance(amount, str):
            self.amount = float(amount)
        self.designation = designation
        self.sales_type = sales_type
        self.comm_struct = comm_struct
        self.company = company

    def self_income(self):
        if self.company == 'Public Mutual':
            rate = self.comm_struct[self.designation][self.sales_type]['Direct']
            calc = self.amount * ( rate / 100 )
            return round(calc, 2)
        return 0
    
    def override(self, downline_designation):
        if self.company == 'Public Mutual':
            rate = self.comm_struct[self.designation][self.sales_type][downline_designation]
            calc = self.amount * ( rate / 100 )
            return round(calc, 2)
        return 0