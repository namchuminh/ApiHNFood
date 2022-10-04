import jwt
from django.conf import settings

def getUserIdByToken(token):
    user_id = jwt.decode(token, settings.SECRET_KEY, algorithms="HS256")
    return user_id['user_id']

def jsonUserData(serializerUser,serializerPerson):
    return {
        "id": serializerUser.data["id"],
        "username": serializerUser.data["username"],
        "first_name": serializerUser.data["first_name"],
        "last_name": serializerUser.data["last_name"],
        "email": serializerUser.data["email"],
        "phone": serializerPerson.data["phone"],
        "money": serializerPerson.data["money"],
        "address": serializerPerson.data["address"],
    }
    