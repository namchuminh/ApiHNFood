from attr import field
from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Food,FoodCategory,FoodCart, Person

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id","username", "password", "first_name", "last_name", "email"]

class UserPutSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["first_name", "last_name", "email",]

class UserRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "password",]

class ChangePasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["password",]

class FoodCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodCategory
        fields = "__all__"

class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = "__all__"

class FoodCartSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodCart
        fields = "__all__"


class FoodCartPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodCart
        fields = ["product", "user"]

class FoodCartPutSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodCart
        fields = ["isOrder"]

        
class PersonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = "__all__"
        
class PersonPutSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ["phone","address",]

class PersonRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ["user","phone",]