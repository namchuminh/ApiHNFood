from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Food,FoodCategory,FoodCart, FoodOrder, Person

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id","username", "password", "first_name", "last_name", "email", "is_superuser"]

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

class FoodPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields = ["name", "description", "price", "price_sale", "image", "image1", "image2", "image3", "category"]


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
        
class FoodOrderGetSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodOrder
        fields = "__all__"

class FoodOrderPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodOrder
        fields = ["user","product","number"]