"""ApiHNFood URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

schema_view = get_schema_view(
   openapi.Info(
      title="HNFood API",
      default_version='v1.0.1',
      description="Đây là phần API Backend cho ứng dụng di động <b>HNFood (xây dựng bởi React Native)</b> - Các API được xây dựng dựa trên các bảng <i><b>User, Food, FoodCategory, FoodCart và Person</b></i> thông qua các câu lệnh truy vấn của ngôn ngữ lập trình <b>Python (Django + Rest Framework)</b> kết hợp với hệ quản trị cơ sở dữ liệu <b>MySQL</b> để lưu trữ dữ liệu.",
      terms_of_service="https://www.google.com/policies/terms/",
      contact=openapi.Contact(email="chuminhnamma@@gmail.com"),
      license=openapi.License(name="BSD License"),
   ),
   public=True,
   permission_classes=[permissions.AllowAny],
)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('Api.urls')),
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
]
