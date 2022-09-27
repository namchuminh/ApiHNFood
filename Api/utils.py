import jwt
from django.conf import settings

def getUserIdByToken(token):
    user_id = jwt.decode(token, settings.SECRET_KEY, algorithms="HS256")
    return user_id['user_id']
