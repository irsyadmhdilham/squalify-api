from django.db.models import Sum
from .period_filter import PointPeriodFilter, ContactPeriodFilter

def difference_percentage(original, new):
    if original == 0 and new == 0:
        return 0
    equ = ((new - original) / ((new + original) / 2)) * 100
    return round(equ, 1)

class Total(PointPeriodFilter):

    current = None
    previous = None

    def __init__(self, profile, period):
        super().__init__(profile, period)
        self.current = self.period_output()['current']
        self.previous = self.period_output()['previous']
    
    def current_point(self):
        total = self.current.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0

    def previous_point(self):
        total = self.previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def difference(self):
        current = self.current_point()
        previous = self.previous_point()
        return difference_percentage(previous, current)
    
    def total(self):
        return {
            'current': self.current_point(),
            'previous': self.previous_point(),
            'diff_percentage': self.difference()
        }

class Contacts(PointPeriodFilter, ContactPeriodFilter):

    current = None
    previous = None
    current_contacts = None
    previous_contacts = None

    def __init__(self, profile, period):
        super().__init__(profile, period)
        self.current = self.period_output()['current']
        self.previous = self.period_output()['previous']
        self.current_contacts = self.contact_period_output()['current']
        self.previous_contacts = self.contact_period_output()['previous']
    
    def face_to_face(self):
        ftf = self.current.filter(attributes__attribute__name='FTF/Nesting/Booth')
        total = ftf.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0

    def referrals(self):
        ftf = self.current.filter(attributes__attribute__name='Referrals')
        total = ftf.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def new_contacts(self):
        return self.contacts_list.count()
    
    def new_contacts_percentage(self):
        current = self.current_contacts.count()
        previous = self.previous_contacts.count()
        return difference_percentage(previous, current)
    
    def client_conversion(self):
        current = self.current_contacts.filter(contact_type__name='Client').count()
        return current

    def client_conversion_percentage(self):
        current = self.current_contacts.filter(contact_type__name='Client').count()
        previous = self.previous_contacts.filter(contact_type__name='Client').count()
        return difference_percentage(previous, current)
    
    def contact_list(self):
        referrals = self.current_contacts.filter(contact_type__name='Referrals')
        booth = self.current_contacts.filter(contact_type__name='Booth')
        ftf = self.current_contacts.filter(contact_type__name='Face to face')
        socmed = self.current_contacts.filter(contact_type__name='Social media')
        nesting = self.current_contacts.filter(contact_type__name='Nesting')
        others = self.current_contacts.filter(contact_type__name='Other')
        ttt = self.current_contacts.filter(contact_type__name='Table to table')
        client = self.current_contacts.filter(contact_type__name='Client')
        return {
            'referrals': referrals.count(),
            'booth': booth.count(),
            'ftf': ftf.count(),
            'socmed': socmed.count(),
            'nesting': nesting.count(),
            'others': others.count(),
            'ttt': ttt.count(),
            'client': client.count()
        }
    
    def contacts(self):
        return {
            'ftf': self.face_to_face(),
            'referrals': self.referrals(),
            'new_contacts': self.new_contacts(),
            'new_contacts_percentage': self.new_contacts_percentage(),
            'client_conversion': self.client_conversion(),
            'client_conversion_percentage': self.client_conversion_percentage(),
            'contacts': self.contact_list()
        }

class Engagement(PointPeriodFilter):

    current = None
    previous = None

    def __init__(self, profile, period):
        super().__init__(profile, period)
        self.current = self.period_output()['current']
        self.previous = self.period_output()['previous']
    
    def calls(self):
        calls = self.current.filter(attributes__attribute__name='Calls/Email/Socmed')
        total = calls.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def servicing(self):
        servicing = self.current.filter(attributes__attribute__name='Servicing/Follow up')
        total = servicing.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def appointment(self):
        appointment = self.current.filter(attributes__attribute__name='Appointment secured')
        total = appointment.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def new_calls(self):
        current = self.calls()
        _previous = self.previous.filter(attributes__attribute__name='Calls/Email/Socmed')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return current - previous

    def new_calls_percentage(self):
        current = self.calls()
        _previous = self.previous.filter(attributes__attribute__name='Calls/Email/Socmed')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return difference_percentage(previous, current)
    
    def new_servicing(self):
        current = self.servicing()
        _previous = self.previous.filter(attributes__attribute__name='Servicing/Follow up')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return current - previous

    def new_servicing_percentage(self):
        current = self.servicing()
        _previous = self.previous.filter(attributes__attribute__name='Servicing/Follow up')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return difference_percentage(previous, current)

    def new_appointment(self):
        current = self.appointment()
        _previous = self.previous.filter(attributes__attribute__name='Appointment secured')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return current - previous

    def new_appointment_percentage(self):
        current = self.appointment()
        _previous = self.previous.filter(attributes__attribute__name='Appointment secured')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return difference_percentage(previous, current)
    
    def engagement(self):
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

class Sales(PointPeriodFilter):

    current = None
    previous = None

    def __init__(self, profile, period):
        super().__init__(profile, period)
        self.current = self.period_output()['current']
        self.previous = self.period_output()['previous']
    
    def sales(self):
        return {
            'sales_presentation': 0,
            'case_closed': 0,
            'new_sales_presentation': 0,
            'new_sales_presentation_percentage': 0,
            'new_cases': 0,
            'new_cases_percentage': 0,
            'total_new_sales': 0
        }

class Recruitment:

    current = None
    previous = None

    def __init__(self, points, period):
        pass
    
    def recruitment(self):
        return {
            'career_presentation': 0,
            'new_recruitment': 0,
            'new_career_presentation': 0,
            'new_career_presentation_percentage': 0,
            'new_recruitment': 0,
            'new_recruitment_percentage': 0
        }

class Career:

    points = None

    def __init__(self, points, period):
        self.points = points
    
    def career(self):
        return {
            'millionaire_suit': 0,
            'update_upline': 0,
            'personal_coaching': 0,
            'training': 0
        }

class Summary(Total, Engagement, Contacts, Sales, Recruitment, Career):

    def __init__(self, profile, period):
        super().__init__(profile, period)
    
    def output(self):
        return {
            'total': self.total(),
            'contacts': self.contacts(),
            'engagement': self.engagement(),
            'sales': self.sales(),
            'recruitment': self.recruitment(),
            'career' self.career():
        }