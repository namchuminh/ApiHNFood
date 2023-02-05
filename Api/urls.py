from django.urls import path, include
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from .views import UserList, Food, FoodDetail, FoodCategory, GetFoodByCategory, FoodCartPutDelete, FoodCartGetPost, ChangePassword, UserRegister, FoodOrder, FoodPopular, Delivery

urlpatterns = [
    path('delivery/', Delivery.as_view(), name='get_delivery'),
    path('order/', FoodOrder.as_view(), name='get_order_food'),
    path('cart/', FoodCartGetPost.as_view(), name='get_post_cart'),
    path('cart/<int:pk>', FoodCartPutDelete.as_view(), name='put_delete_cart'),
    path('food/category/', FoodCategory.as_view(), name='all_category'),
    path('food/category/<int:pk>/', GetFoodByCategory.as_view(), name='get_food_by_category'),
    path('food/<int:pk>/', FoodDetail.as_view(), name='detail_food'),
    path('food/popular/', FoodPopular.as_view(), name='popular_food'),
    path('food/', Food.as_view(), name='all_food'),
    path('user/', UserList.as_view(), name='user'),
    path('user/password/', ChangePassword.as_view(), name='password'),
    path('user/login/', TokenObtainPairView.as_view(), name='user_login_token'),
    path('user/register/', UserRegister.as_view(), name='user_register'),
    path('user/logout/', TokenRefreshView.as_view(), name='user_refresh_token'),
]



