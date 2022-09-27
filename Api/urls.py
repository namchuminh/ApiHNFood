from django.urls import path, include
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from .views import UserList, Food, FoodDetail, FoodCategory, GetFoodByCategory, FoodCart

urlpatterns = [
    path('cart/<int:pk>', FoodCart.as_view()),
    path('cart/', FoodCart.as_view(), name='food_cart'),
    path('category/', FoodCategory.as_view(), name='all_category'),
    path('food/category/<int:pk>/', GetFoodByCategory.as_view(), name='get_food_by_category'),
    path('food/<int:pk>/', FoodDetail.as_view(), name='detail_food'),
    path('food/', Food.as_view(), name='all_food'),
    path('user/', UserList.as_view()),
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]



