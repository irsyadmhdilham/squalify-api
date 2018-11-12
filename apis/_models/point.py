from django.db import models

class Point(models.Model):
    millionnaire_suit = models.IntegerField(default=0)
    be_early_training = models.IntegerField(default=0)
    calls_emails_socmed = models.IntegerField(default=0)
    appointment_secured = models.IntegerField(default=0)
    referrals = models.IntegerField(default=0)
    sales_presentation = models.IntegerField(default=0)
    ftf_booth_nesting = models.IntegerField(default=0)
    case_closed = models.IntegerField(default=0)
    career_presentation = models.IntegerField(default=0)
    sign_up_contract = models.IntegerField(default=0)
    personal_coaching = models.IntegerField(default=0)
    joining_field_work = models.IntegerField(default=0)
    servicing_follow_up = models.IntegerField(default=0)
    update_upline = models.IntegerField(default=0)
    agency_program = models.IntegerField(default=0)
    date = models.DateField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.date)