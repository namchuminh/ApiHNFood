from django.contrib import admin
from .models import FoodCategory, Food, FoodOrder, Person, FoodCart
from import_export.admin import ImportExportModelAdmin
# Register your models here.
@admin.register(FoodCategory)
class FoodCategoryAdmin(ImportExportModelAdmin):
    pass


@admin.register(Food)
class FoodAdmin(ImportExportModelAdmin):
    pass


admin.site.register(Person)
admin.site.register(FoodCart)
admin.site.register(FoodOrder)
