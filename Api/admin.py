from django.contrib import admin
from .models import FoodCategory, Food, FoodOrder, Person, FoodCart
# Register your models here.
admin.site.register(FoodCategory)
admin.site.register(Food)
admin.site.register(Person)
admin.site.register(FoodCart)
admin.site.register(FoodOrder)
