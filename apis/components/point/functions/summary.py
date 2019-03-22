from django.db.models import Sum
from .period_filter import PeriodFilter

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
    
    def result(self):
        return {
            'current': self.current_point(),
            'previous': self.previous_point(),
            'diff_percentage': self.difference()
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
        ftf = self.current.filter(attributes__attribute__name='FTF/Nesting/Booth')
        total = ftf.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0

    def referrals(self):
        ftf = self.current.filter(attributes__attribute__name='Referral')
        total = ftf.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def new_contacts(self):
        current = self.current_contacts.count()
        previous = self.previous_contacts.count()
        return current - previous
    
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
        referrals = self.current_contacts.filter(contact_type__name='Referral')
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
            'other': others.count(),
            'ttt': ttt.count(),
            'client': client.count()
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
    
    def sales_presentation(self):
        sales_presentation = self.current.filter(attributes__attribute__name='Sales presentation')
        total = sales_presentation.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def case_closed(self):
        case_closed = self.current.filter(attributes__attribute__name='Case closed')
        total = case_closed.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def new_sales_presentation(self):
        current = self.sales_presentation()
        _previous = self.previous.filter(attributes__attribute__name='Sales presentation')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return current - previous

    def new_sales_presentation_percentage(self):
        current = self.sales_presentation()
        _previous = self.previous.filter(attributes__attribute__name='Sales presentation')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return difference_percentage(previous, current)

    def new_cases(self):
        current = self.case_closed()
        _previous = self.previous.filter(attributes__attribute__name='Case closed')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return current - previous

    def new_cases_percentage(self):
        current = self.case_closed()
        _previous = self.previous.filter(attributes__attribute__name='Case closed')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
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
    
    def career_presentation(self):
        career_presentation = self.current.filter(attributes__attribute__name='Career presentation')
        total = career_presentation.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def recruitment(self):
        recruitment = self.current.filter(attributes__attribute__name='Sign up contract')
        total = recruitment.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def new_career_presentation(self):
        current = self.career_presentation()
        _previous = self.previous.filter(attributes__attribute__name='Career presentation')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return current - previous

    def new_career_presentation_percentage(self):
        current = self.career_presentation()
        _previous = self.previous.filter(attributes__attribute__name='Career presentation')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return difference_percentage(previous, current)

    def new_recruitment(self):
        current = self.recruitment()
        _previous = self.previous.filter(attributes__attribute__name='Sign up contract')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
        return current - previous

    def new_recruitment_percentage(self):
        current = self.recruitment()
        _previous = self.previous.filter(attributes__attribute__name='Sign up contract')
        total = _previous.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            previous = total
        else:
            previous = 0
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
    
    def millionaire_suit(self):
        obj = self.current.filter(attributes__attribute__name='Millionnaire suit')
        total = obj.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def update_upline(self):
        obj = self.current.filter(attributes__attribute__name='Update upline')
        total = obj.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def personal_coaching(self):
        obj = self.current.filter(attributes__attribute__name='Personal coaching')
        total = obj.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
    def training(self):
        obj = self.current.filter(attributes__attribute__name='Agency program')
        total = obj.aggregate(total=Sum('attributes__point'))['total']
        if total is not None:
            return total
        return 0
    
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

    def __init__(self, profile, period):
        super().__init__(profile, period)
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