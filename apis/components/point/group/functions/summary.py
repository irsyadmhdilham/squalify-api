from django.db.models import Sum
from .period_filter import PeriodFilter
from functools import reduce

def difference_percentage(original, new):
    if original == 0 and new == 0:
        return 0
    equ = ((new - original) / ((new + original) / 2)) * 100
    return round(equ, 1)

class Total:

    current = None
    previous = None

    def __init__(self, current, previous):
        self.current = current
        self.previous = previous
    
    def mapper(self, value):
        total = value.attributes.aggregate(total=Sum('point'))['total']
        if total is not None:
            return total
        return 0
    
    def current_point(self):
        if len(self.current) > 0:
            points = map(self.mapper, self.current)
            return reduce(lambda a, b: a + b, points)
        return 0

    def previous_point(self):
        if len(self.previous) > 0:
            points = map(self.mapper, self.previous)
            return reduce(lambda a, b: a + b, points)
        return 0
    
    def difference_percentage(self):
        current = self.current_point()
        previous = self.previous_point()
        return difference_percentage(previous, current)

    def difference(self):
        current = self.current_point()
        previous = self.previous_point()
        return current - previous
    
    def result(self):
        return {
            'current': self.current_point(),
            'difference': self.difference(),
            'diff_percentage': self.difference_percentage()
        }

class Contacts:

    current_contacts = None
    previous_contacts = None
    current = None
    previous = None

    def __init__(self, current, previous, current_contacts, previous_contacts):
        self.current = current
        self.previous = previous
        self.current_contacts = current_contacts
        self.previous_contacts = previous_contacts
    
    def face_to_face(self):
        def mapper(value):
            filtered = value.attributes.filter(attribute__name='FTF/Nesting/Booth')
            total = filtered.aggregate(total=Sum('point'))['total']
            if total is not None:
                return total
            return 0

        if len(self.current) > 0:
            points = map(mapper, self.current)
            total = reduce(lambda a, b: a + b, points)
        return 0

    def referrals(self):
        def mapper(value):
            filtered = value.attributes.filter(attribute__name='Referral')
            total = filtered.aggregate(total=Sum('point'))['total']
            if total is not None:
                return total
            return 0

        if len(self.current) > 0:
            points = map(mapper, self.current)
            total = reduce(lambda a, b: a + b, points)
        return 0
    
    def new_contacts(self):
        current = len(self.current_contacts)
        previous = len(self.previous_contacts)
        return current - previous
    
    def new_contacts_percentage(self):
        current = len(self.current_contacts)
        previous = len(self.previous_contacts)
        return difference_percentage(previous, current)
    
    def client_conversion(self):
        current = filter(lambda val: str(val.contact_type) == 'Client', self.current_contacts)
        previous = filter(lambda val: str(val.contact_type) == 'Client', self.previous_contacts)
        return len(list(current)) - len(list(previous))

    def client_conversion_percentage(self):
        current = filter(lambda val: str(val.contact_type) == 'Client', self.current_contacts)
        previous = filter(lambda val: str(val.contact_type) == 'Client', self.previous_contacts)
        return difference_percentage(len(list(previous)), len(list(current)))
    
    def contact_list(self):
        referrals = filter(lambda val: str(val.contact_type) == 'Referral', self.current_contacts)
        booth = filter(lambda val: str(val.contact_type) == 'Booth', self.current_contacts)
        ftf = filter(lambda val: str(val.contact_type) == 'Face to face', self.current_contacts)
        socmed = filter(lambda val: str(val.contact_type) == 'Social media', self.current_contacts)
        nesting = filter(lambda val: str(val.contact_type) == 'Nesting', self.current_contacts)
        others = filter(lambda val: str(val.contact_type) == 'Other', self.current_contacts)
        ttt = filter(lambda val: str(val.contact_type) == 'Table to table', self.current_contacts)
        client = filter(lambda val: str(val.contact_type) == 'Client', self.current_contacts)
        return {
            'referrals': len(list(referrals)),
            'booth': len(list(booth)),
            'ftf': len(list(ftf)),
            'socmed': len(list(socmed)),
            'nesting': len(list(nesting)),
            'other': len(list(others)),
            'ttt': len(list(ttt)),
            'client': len(list(client))
        }
    
    def result(self):
        return {
            'ftf': self.face_to_face(),
            'referrals': self.referrals(),
            'new_contacts': self.new_contacts(),
            'new_contacts_percentage': self.new_contacts_percentage(),
            'client_conversion': self.client_conversion(),
            'client_conversion_percentage': self.client_conversion_percentage(),
            'contacts': self.contact_list()
        }

class Engagement:

    current = None
    previous = None

    def __init__(self, current, previous):
        self.current = current
        self.previous = previous

    def point_mapper(self, point_list, attribute):
        def mapper(value):
            filtered = value.attributes.filter(attribute__name=attribute)
            total = filtered.aggregate(total=Sum('point'))['total']
            if total is not None:
                return total
            return 0

        if len(point_list) > 0:
            points = map(mapper, point_list)
            return reduce(lambda a, b: a + b, points)
        return 0
    
    def calls(self):
        return self.point_mapper(self.current, 'Calls/Email/Socmed')
    
    def servicing(self):
        return self.point_mapper(self.current, 'Servicing/Follow up')
    
    def appointment(self):
        return self.point_mapper(self.current, 'Appointment secured')
    
    def new_calls(self):
        current = self.calls()
        previous = self.point_mapper(self.previous, 'Calls/Email/Socmed')
        return current - previous

    def new_calls_percentage(self):
        current = self.calls()
        previous = self.point_mapper(self.previous, 'Calls/Email/Socmed')
        return difference_percentage(previous, current)
    
    def new_servicing(self):
        current = self.servicing()
        previous = self.point_mapper(self.previous, 'Servicing/Follow up')
        return current - previous

    def new_servicing_percentage(self):
        current = self.servicing()
        previous = self.point_mapper(self.previous, 'Servicing/Follow up')
        return difference_percentage(previous, current)

    def new_appointment(self):
        current = self.appointment()
        previous = previous = self.point_mapper(self.previous, 'Appointment secured')
        return current - previous

    def new_appointment_percentage(self):
        current = self.appointment()
        previous = previous = self.point_mapper(self.previous, 'Appointment secured')
        return difference_percentage(previous, current)
    
    def result(self):
        return {
            'calls': self.calls(),
            'servicing': self.servicing(),
            'appointment': self.appointment(),
            'new_calls': self.new_calls(),
            'new_calls_percentage': self.new_calls_percentage(),
            'new_servicing': self.new_servicing(),
            'new_servicing_percentage': self.new_servicing_percentage(),
            'new_appointment': self.new_appointment(),
            'new_appointment_percentage': self.new_appointment_percentage()
        }

class Sales:

    current = None
    previous = None

    def __init__(self, current, previous):
        self.current = current
        self.previous = previous
    
    def point_mapper(self, point_list, attribute):
        def mapper(value):
            filtered = value.attributes.filter(attribute__name=attribute)
            total = filtered.aggregate(total=Sum('point'))['total']
            if total is not None:
                return total
            return 0

        if len(point_list) > 0:
            points = map(mapper, point_list)
            return reduce(lambda a, b: a + b, points)
        return 0
    
    def sales_presentation(self):
        return self.point_mapper(self.current, 'Sales presentation')
    
    def case_closed(self):
        return self.point_mapper(self.current, 'Case closed')
    
    def new_sales_presentation(self):
        current = self.sales_presentation()
        previous = self.point_mapper(self.previous, 'Sales presentation')
        return current - previous

    def new_sales_presentation_percentage(self):
        current = self.sales_presentation()
        previous = self.point_mapper(self.previous, 'Sales presentation')
        return difference_percentage(previous, current)

    def new_cases(self):
        current = self.case_closed()
        previous = self.point_mapper(self.previous, 'Case closed')
        return current - previous

    def new_cases_percentage(self):
        current = self.case_closed()
        previous = self.point_mapper(self.previous, 'Case closed')
        return difference_percentage(previous, current)
    
    def result(self):
        return {
            'sales_presentation': self.sales_presentation(),
            'case_closed': self.case_closed(),
            'new_sales_presentation': self.new_sales_presentation(),
            'new_sales_presentation_percentage': self.new_sales_presentation_percentage(),
            'new_cases': self.new_cases(),
            'new_cases_percentage': self.new_cases_percentage(),
            'total_new_sales': 0
        }

class Recruitment:

    current = None
    previous = None

    def __init__(self, current, previous):
        self.current = current
        self.previous = previous

    def point_mapper(self, point_list, attribute):
        def mapper(value):
            filtered = value.attributes.filter(attribute__name=attribute)
            total = filtered.aggregate(total=Sum('point'))['total']
            if total is not None:
                return total
            return 0

        if len(point_list) > 0:
            points = map(mapper, point_list)
            return reduce(lambda a, b: a + b, points)
        return 0
    
    def career_presentation(self):
        return self.point_mapper(self.current, 'Career presentation')
    
    def recruitment(self):
        return self.point_mapper(self.current, 'Sign up contract')
    
    def new_career_presentation(self):
        current = self.career_presentation()
        previous = self.point_mapper(self.previous, 'Career presentation')
        return current - previous

    def new_career_presentation_percentage(self):
        current = self.career_presentation()
        previous = self.point_mapper(self.previous, 'Career presentation')
        return difference_percentage(previous, current)

    def new_recruitment(self):
        current = self.recruitment()
        previous = self.point_mapper(self.previous, 'Sign up contract')
        return current - previous

    def new_recruitment_percentage(self):
        current = self.recruitment()
        previous = self.point_mapper(self.previous, 'Sign up contract')
        return difference_percentage(previous, current)
    
    def result(self):
        return {
            'career_presentation': self.career_presentation(),
            'recruitment': self.recruitment(),
            'new_career_presentation': self.new_career_presentation(),
            'new_career_presentation_percentage': self.new_career_presentation_percentage(),
            'new_recruitment': self.new_career_presentation(),
            'new_recruitment_percentage': self.new_career_presentation_percentage()
        }

class Career:

    current = None

    def __init__(self, current):
        self.current = current

    def point_mapper(self, point_list, attribute):
        def mapper(value):
            filtered = value.attributes.filter(attribute__name=attribute)
            total = filtered.aggregate(total=Sum('point'))['total']
            if total is not None:
                return total
            return 0

        if len(point_list) > 0:
            points = map(mapper, point_list)
            return reduce(lambda a, b: a + b, points)
        return 0
    
    def millionaire_suit(self):
        return self.point_mapper(self.current, 'Millionnaire suit')
    
    def update_upline(self):
        return self.point_mapper(self.current, 'Update upline')
    
    def personal_coaching(self):
        return self.point_mapper(self.current, 'Personal coaching')
    
    def training(self):
        return self.point_mapper(self.current, 'Agency program')
    
    def result(self):
        return {
            'millionaire_suit': self.millionaire_suit(),
            'update_upline': self.update_upline(),
            'personal_coaching': self.personal_coaching(),
            'training': self.training()
        }

class Summary(PeriodFilter):

    current = None
    previous = None
    current_contacts = None
    previous_contacts = None

    def __init__(self, group, period):
        super().__init__(group, period)
        self.current = self.period_output()['current']
        self.previous = self.period_output()['previous']
        self.current_contacts = self.contact_period_output()['current']
        self.previous_contacts = self.contact_period_output()['previous']
    
    def summary(self):
        total = Total(self.current, self.previous)
        contacts = Contacts(self.current, self.previous, self.current_contacts, self.previous_contacts)
        engagement = Engagement(self.current, self.previous)
        sales = Sales(self.current, self.previous)
        recruitment = Recruitment(self.current, self.previous)
        career = Career(self.current)
        return {
            'total': total.result(),
            'contacts': contacts.result(),
            'engagement': engagement.result(),
            'sales': sales.result(),
            'recruitment': recruitment.result(),
            'career': career.result()
        }