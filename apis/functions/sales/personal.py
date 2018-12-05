from datetime import date, timedelta, datetime
from apis._models.profile import Profile
from django.db.models import Q
from .sales_type import Serializer
import pytz

class Personal:

    sales = None
    company = None
    designation = None
    comm_struct = None

    def __init__(self, user_pk, comm_struct):
        profile = Profile.objects.get(pk=user_pk)
        self.sales = profile.sales
        self.company = profile.agency.company.name
        self.designation = profile.designation.name
        self.comm_struct = comm_struct
    
    def year(self):
        current_year = date.today().year
        sales = self.sales.filter(timestamp__year=current_year)
        response = Serializer(sales, self.designation, self.company, self.comm_struct)
        return response.personal()
    
    def month(self):
        current_year = date.today().year
        current_month = date.today().month
        sales = self.sales.filter(
            Q(timestamp__year=current_year) &
            Q(timestamp__month=current_month)
        )
        response = Serializer(sales, self.designation, self.company, self.comm_struct)
        return response.personal()
    
    def today(self):
        sales = self.sales.filter(timestamp__date=date.today())
        response = Serializer(sales, self.designation, self.company, self.comm_struct)
        return response.personal()