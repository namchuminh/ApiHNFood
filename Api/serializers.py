from attr import field
from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Food,FoodCategory,FoodCart

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', ]

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

    