from django.db.models import Q
from apis._models.profile import Profile, Designation
from apis._models.group import Group
from apis._models.agency import Agency
from apis._models.industry import Industry
from apis._models.company import Company

def get_agency(agency_name, industry, company, agency_id):
    if agency_id is not None:
        return Agency.objects.get(pk=agency_id)
    agency = Agency.objects.filter(
        Q(name__iexact=agency_name) &
        Q(industry__industry=industry) &
        Q(company__company=company)
    )
    count = agency.count()
    if count == 0:
        return None
    return agency[0]

def get_upline(upline_id):
    if upline_id is None:
        return None
    upline = Profile.objects.get(pk=upline_id)
    if upline is None:
        return None
    return upline

class CreateAccount:
    
    def __init__(self, user, name, designation, industry, company, agency_name, agency_id=None, upline_id=None):
        self.user = user
        self.name = name
        self.agency_name = agency_name
        self.designation = Designation.objects.get(designation=designation)
        self.industry = Industry.objects.get(industry=industry)
        self.company = Company.objects.get(company=company)
        self.agency = get_agency(agency_name, industry, company, agency_id)
        self.upline = get_upline(upline_id)
        self.group = None
        self.profile = None
    
    def create_profile(self):
        try:
            profile = Profile.objects.create(
                user=self.user,
                name=self.name,
                designation=self.designation,
                agency=self.agency,
                group=self.group,
                upline=self.upline
            )
            profile.save()
            self.profile = profile
            return True
        except:
            return False
    
    def create_agency(self):
        try:
            if self.designation.designation != 'Group Agency Manager':
                raise ValueError
            agency = Agency.objects.filter(
                Q(name__iexact=self.agency_name) &
                Q(industry__industry=self.industry) &
                Q(company__company=self.company)
            )
            count = agency.count()
            if count != 0:
                return False
            agency = Agency.objects.create(
                name=self.agency_name,
                owner=self.user,
                industry=self.industry,
                company=self.company
            )
            agency.save()
            self.agency = agency
            return True
        except ValueError as err:
            return err
    
    def add_member_agency(self):
        try:
            if self.profile is not None:
                self.agency.members.add(self.profile)
            return True
        except:
            return False
    
    def create_group(self):
        try:
            group = Group.objects.create(industry=self.industry, company=self.company, owner=self.user)
            group.save()
            self.group = group
            return True
        except:
            return False
    
    def add_upline_group(self):
        if self.profile is not None and self.upline is not None:
            self.upline.group.members.add(self.profile)