from .models import User

class EmailAuthBackend:

    def authenticate(email=None, password=None):
        try:
            user = User.objects.get(email=email)
            if User.check_password(password):
                return user
            else:
                return None
        except User.DoesNotExist as not_exist:
            return not_exist
            

    def get_user(user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None
