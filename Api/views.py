from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse
from django.http import Http404
from numpy import delete, product
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from Api.utils import getUserIdByToken
from .serializers import UserSerializer,FoodSerializer, FoodCategorySerializer, FoodCartSerializer
from django.contrib.auth.models import User
from .models import Food as Foo
from .models import FoodCategory as FooCategory
from .models import FoodCart as FooCart
from rest_framework import permissions


# Create your views here.

class UserList(APIView):
    def get(self, request, format=None):
        users = User.objects.all() # SELECT * FROM User
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)

class Food(APIView):
    def get(self, request, format=None):
        foods = Foo.objects.all()
        serializer = FoodSerializer(foods, many=True)
        return Response(serializer.data)
    
class FoodDetail(APIView):
    def get_object(self, pk):
        try:
            return Foo.objects.get(pk=pk)
        except Foo.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        foods = self.get_object(pk)
        serializer = FoodSerializer(foods)
        return Response(serializer.data)

class FoodCategory(APIView):
    def get(self, request, format=None):
        foodCategorys = FooCategory.objects.all()
        serializer = FoodCategorySerializer(foodCategorys, many=True)
        return Response(serializer.data)
    
class GetFoodByCategory(APIView):
    def get_object(self, pk):
        try:
            if pk is None:
                raise Http404
            category = FooCategory.objects.all().get(pk = pk)
            return Foo.objects.filter(category = category)
        except Foo.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        foodByCategory = self.get_object(pk)
        serializer = FoodSerializer(foodByCategory, many=True)
        return Response(serializer.data)

class FoodCart(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def get_object(self, request):
        try:
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            user = User.objects.all().get(pk = uid)
            return FooCart.objects.filter(user = user, isOrder = False)
        except FooCart.DoesNotExist:
            raise Http404
        
    def get(self, request, format=None):
        foodCart = self.get_object(request)
        serializer = FoodCartSerializer(foodCart, many=True)
        return Response(serializer.data)

    def post(self, request):
        try:
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            request.data["user"] = uid
            serializer = FoodCartSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)
        
    def put_object(self, pk):
        try:
            if pk is None:
                return Http404
            return FooCart.objects.get(pk=pk, isOrder=False)
        except FooCart.DoesNotExist:
            raise Http404
        
    def put(self, request, pk):
        token = request.headers.get('Authorization').split(' ')[1]
        uid = getUserIdByToken(token=token)
        request.data["user"] = uid
        foodCart = self.put_object(pk)
        serializer = FoodCartSerializer(foodCart, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete_object(self, request, pk):
        try:
            if pk is None:
                return Http404
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            user = User.objects.all().get(pk = uid)
            return FooCart.objects.filter(pk=pk, user=user)
        except FooCart.DoesNotExist:
            raise Http404
    
    def delete(self, request, pk):
        foodCart = self.delete_object(request,pk)
        foodCart.delete()
        return Response({'message' : 'Success'},status=status.HTTP_204_NO_CONTENT)
        

