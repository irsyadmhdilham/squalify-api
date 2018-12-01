from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response

from account.models import User
from apis.functions.create_account import CreateAccount

class CreateAccountView(APIView):

    def post(self, request, format=None):
        data = request.data
        email = data.get('email')
        password = data.get('password')
        name = data.get('name')
        designation = data.get('designation')
        industry = data.get('industry')
        company = data.get('company')
        agency_name = data.get('agency_name')
        upline_id = data.get('upline_id')
        agency_id = data.get('agency_id')

        try:
            """check user signed up or not"""
            check_user = User.objects.filter(email__exact=email).count()
            if check_user is not 0:
                raise ValueError('User already signed up')
            user = User.objects.create_user(email, password)
            user.save()

            """instantiate create account class"""
            create_account = CreateAccount(
                user=user,
                name=name,
                designation=designation,
                industry=industry,
                company=company,
                agency_name=agency_name,
                agency_id=agency_id,
                upline_id=upline_id
            )

            if designation == 'Group Agency Manager':

                """User is Group Agency Manager"""
                
                """Create agency"""
                create_agency = create_account.create_agency()
                
                """Create group"""
                create_group = create_account.create_group()
                
                """create profile"""
                create_profile = create_account.create_profile()
                
                """Add members in agency and group"""
                create_account.add_member_agency()

                return Response({'details': 'Successfully create account'}, status=status.HTTP_200_OK)
            else:

                """User is not Group Agency Manager"""
                
                if designation != 'Unit Trust Constultant':
                    """Create group"""
                    create_group = create_account.create_group()
                
                """Create profile"""
                create_profile = create_account.create_profile()
                
                """Add members in agency and group"""
                create_account.add_member_agency()
                create_account.add_upline_group()

                return Response({'details': 'Successfully create account'}, status=status.HTTP_200_OK)

        except ValueError as err:
            return Response({ 'error': str(err)},status=status.HTTP_400_BAD_REQUEST)