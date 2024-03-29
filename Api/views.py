from ast import Delete
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from Api.utils import getUserIdByToken, jsonUserData
from .serializers import FoodPostSerializer, PersonSerializer, UserSerializer,FoodSerializer, FoodCategorySerializer, FoodCartSerializer, PersonRegisterSerializer, UserRegisterSerializer
from .serializers import UserPutSerializer, PersonPutSerializer, ChangePasswordSerializer, FoodCartPostSerializer, FoodCartPutSerializer
from .serializers import FoodOrderGetSerializer, FoodOrderPostSerializer
from django.contrib.auth.models import User
from .models import Food as Foo, Person
from .models import FoodCategory as FooCategory
from .models import FoodCart as FooCart
from .models import FoodOrder as FooOrder
from rest_framework import permissions
from django.contrib.auth.hashers import make_password
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from rest_framework.decorators import api_view
from rest_framework import generics
from django.db.models import Count
from rest_framework.parsers import FormParser, MultiPartParser
from django.core.files.storage import FileSystemStorage

# Create your views here.

class UserList(APIView):
    permission_classes = [permissions.IsAuthenticated]
    @swagger_auto_schema(
        operation_description='Lấy ra thông tin chi tiết của User dựa theo Token',
        operation_summary='Lấy ra thông tin chi tiết của một User',
    )
    def get(self, request, format=None):
        token = request.headers.get('Authorization').split(' ')[1]
        uid = getUserIdByToken(token=token)
        user = User.objects.all().get(pk=uid)   
        person = Person.objects.all().get(user=user)
        serializerUser = UserSerializer(user)
        serializerPerson = PersonSerializer(person)
        serializer = jsonUserData(serializerUser,serializerPerson)
        return Response(serializer, status=status.HTTP_200_OK)
    
    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'first_name': openapi.Schema(type=openapi.TYPE_STRING, description='Nguyễn', default='Nguyễn'),
                'last_name': openapi.Schema(type=openapi.TYPE_STRING, description='Văn A', default='Văn A'),
                'email': openapi.Schema(type=openapi.TYPE_STRING, description='nguyenvana@gmail.com', default='nguyenvana@gmail.com'),
                'phone': openapi.Schema(type=openapi.TYPE_STRING, description='0999888777', default='0999888777'),
                'address': openapi.Schema(type=openapi.TYPE_STRING, description='Địa chỉ nhà, Xã/Phường, Quận/huyện, Thành Phố', default='Địa chỉ nhà, Xã/Phường, Quận/huyện, Thành Phố'),
            }
        ),
        operation_description='Cập nhật thông tin chi tiết User dựa theo Token',
        operation_summary='Cập nhật thông tin chi tiết của User'
    )
    def put(self, request, format=None):
        token = request.headers.get('Authorization').split(' ')[1]
        uid = getUserIdByToken(token=token)
        user = User.objects.all().get(pk=uid)  
        person = Person.objects.all().get(user=user)
        serializerUser = UserPutSerializer(user, data=request.data)
        serializerPerson = PersonPutSerializer(person, data=request.data)
        if serializerUser.is_valid():
            if serializerPerson.is_valid():
                serializerUser.save()
                serializerPerson.save()
                return Response({"message" : "Success!"}, status=status.HTTP_200_OK)
        return Response({"message" : "Faild update!"}, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

class UserRegister(APIView):
    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'username': openapi.Schema(type=openapi.TYPE_STRING, description='Tên đăng nhập', default='nguyenvana'),
                'password': openapi.Schema(type=openapi.TYPE_STRING, description='Mật khẩu', default='nguyenvana123!@'),
                'phone': openapi.Schema(type=openapi.TYPE_STRING, description='Số điện thoại', default='0999888777'),
            }
        ),
        operation_description='Đang ký tài khoản người dùng mới bao gồm username, password, phone',
        operation_summary='Tạo mới một tài khoản cho người dùng'
    )
    def post(self, request, format=None):
        try:
            request.data["password"] = make_password(request.data["password"], None, "pbkdf2_sha256")
            serializerUser = UserRegisterSerializer(data=request.data)
            if serializerUser.is_valid():
                    serializerUser.save()
                    id = User.objects.last().id
                    dataPerson = {
                        "user" : id,
                        "phone" : request.data["phone"],
                    }
                    serializerPerson = PersonRegisterSerializer(data=dataPerson)
                    if serializerPerson.is_valid():
                        serializerPerson.save()
                        return Response({"message" : "Success!"}, status=status.HTTP_201_CREATED)
            return Response({"message" : "Account already exists!"}, status=status.HTTP_406_NOT_ACCEPTABLE)
        except:
            return Response({"message" : "Register Faild!"}, status=status.HTTP_400_BAD_REQUEST)
        
class ChangePassword(APIView):
    permission_classes = [permissions.IsAuthenticated]
    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'password': openapi.Schema(type=openapi.TYPE_STRING, description='Mật khẩu mới', default='Abc123@'),
            }
        ),
        operation_description='Cập nhật mật khẩu của một User dựa theo Token',
        operation_summary='Cập nhật mật khẩu của một User'
    )
    def put(self, request):
        token = request.headers.get('Authorization').split(' ')[1]
        uid = getUserIdByToken(token=token)
        user = User.objects.all().get(pk=uid)  
        request.data["password"] = make_password(request.data["password"], None, "pbkdf2_sha256")
        serializer = ChangePasswordSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"message" : "Success!"}, status=status.HTTP_200_OK)
        return Response({"message" : "Faild update password!"}, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

class Food(APIView):
    
    search_param = openapi.Parameter('search', openapi.IN_QUERY, description="Tên món ăn cần tìm kiếm", type=openapi.TYPE_STRING)
    
    @swagger_auto_schema(
        operation_description="Lấy tất cả thông tin đồ ăn trong bảng Food",
        operation_summary="Lấy tất cả thông tin đồ ăn",
        manual_parameters=[search_param]
        
    )
    def get(self, request, format=None):
        foods = Foo.objects.all()
        search = request.query_params.get('search')
        if search is not None:
            foods = Foo.objects.all().filter(name__icontains=search)
        serializer = FoodSerializer(foods, many=True)
        return Response(serializer.data)
    
    @swagger_auto_schema(
        operation_description="Thêm thông tin sản phẩm ",
        operation_summary="Thêm sản phẩm"
    )
    def post(self, request, format=None):
        
        image = request.FILES['image']
        fs = FileSystemStorage()
        fs.save('uploads/' + image.name, image)
        image = 'uploads/' + image.name
        
        image1 = request.FILES['image1']
        fs = FileSystemStorage()
        fs.save('uploads/' + image1.name, image1)
        image1 = 'uploads/' + image1.name
        
        image2 = request.FILES['image2']
        fs = FileSystemStorage()
        fs.save('uploads/' + image2.name, image2)
        image2 = 'uploads/' + image2.name
        
        image3 = request.FILES['image3']
        fs = FileSystemStorage()
        fs.save('uploads/' + image3.name, image3)
        image3 = 'uploads/' + image3.name
        
        request.data['image'] = image
        request.data['image1'] = image1
        request.data['image2'] = image2
        request.data['image3'] = image3
        
        
        category = FooCategory.objects.all().get(pk=request.data['category'])
        food = Foo(name=request.data['name'], description=request.data['description'], price=request.data['price'], price_sale=request.data['price_sale'], category=category, image=request.data['image'],image1=request.data['image1'],image2=request.data['image2'], image3=request.data['image3'])
        food.save()
        return Response({"msg": "success"}, status=status.HTTP_200_OK)
    
    @swagger_auto_schema(
        operation_description="Cập nhật thông tin sản phẩm ",
        operation_summary="Cập nhật sản phẩm"
    )
    
    def put(self, request, format=None):
        pk = request.data['pk']
        food = Foo.objects.all().get(pk=pk)
        
        image = request.FILES['image']
        fs = FileSystemStorage()
        fs.save('uploads/' + image.name, image)
        image = 'uploads/' + image.name
        
        image1 = request.FILES['image1']
        fs = FileSystemStorage()
        fs.save('uploads/' + image1.name, image1)
        image1 = 'uploads/' + image1.name
        
        image2 = request.FILES['image2']
        fs = FileSystemStorage()
        fs.save('uploads/' + image2.name, image2)
        image2 = 'uploads/' + image2.name
        
        image3 = request.FILES['image3']
        fs = FileSystemStorage()
        fs.save('uploads/' + image3.name, image3)
        image3 = 'uploads/' + image3.name
        
        request.data['image'] = image
        request.data['image1'] = image1
        request.data['image2'] = image2
        request.data['image3'] = image3
        
        category = FooCategory.objects.all().get(pk=request.data['category'])
        food.name=request.data['name']
        food.description=request.data['description']
        food.price=request.data['price']
        food.price_sale=request.data['price_sale']
        food.category=category
        food.image=request.data['image']
        food.image1=request.data['image1']
        food.image2=request.data['image2']
        food.image3=request.data['image3']
        food.save()
        
        return Response({"msg": "success"}, status=status.HTTP_200_OK)
        
    @swagger_auto_schema(
        operation_description="Xóa thông tin sản phẩm ",
        operation_summary="Xóa sản phẩm"
    )
    def delete(self, request, format=None):
        try:
            pk = request.data['pk']
            print(pk)
            if pk is None:
                return Http404
            food = Foo.objects.all().get(pk=pk)
            food.delete()
            return Response({'message' : 'Success'},status=status.HTTP_204_NO_CONTENT)
        except FooCart.DoesNotExist:
            raise Http404    

class FoodDetail(APIView):
    @swagger_auto_schema(
        operation_description="Lấy chi tiết thông tin của một sản phẩm dựa theo ID sản phẩm",
        operation_summary="Lấy thông tin sản phẩm theo ID sản phẩm",
    )
    def get(self, request, pk, format=None):
        try:
            foods = Foo.objects.get(pk=pk)
            serializer = FoodSerializer(foods)
            return Response(serializer.data)
        except Foo.DoesNotExist:
            raise Http404
        
class FoodCategory(APIView):
    @swagger_auto_schema(
        operation_description="Lấy tất cả thông tin của các chuyên mục trong bảng Category",
        operation_summary="Lấy tất toàn bộ thông tin của chuyên mục"
    )
    def get(self, request, format=None):
        foodCategorys = FooCategory.objects.all()
        serializer = FoodCategorySerializer(foodCategorys, many=True)
        return Response(serializer.data)

class FoodPopular(APIView):
    @swagger_auto_schema(
        operation_description="Lấy thông tin các sản phẩn nổi bật trong bảng Food",
        operation_summary="Lấy tất thông tin sản phẩn nổi bật"
    )
    def get(self, request, format=None):
        food = Foo.objects.all().filter(popular=True)
        serializer = FoodSerializer(food, many=True)
        return Response(serializer.data)
    
    
class GetFoodByCategory(APIView):
    @swagger_auto_schema(
        operation_description="Lấy tất cả thông tin của các sản phẩm dựa theo ID của chuyên mục",
        operation_summary="Lấy toàn bộ thông tin sản phẩm theo ID chuyên mục"
    )
    def get(self, request, pk, format=None):
        try:
            if pk is None:
                raise Http404
            category = FooCategory.objects.all().get(pk = pk)
            foodByCategory = Foo.objects.filter(category = category)
            serializer = FoodSerializer(foodByCategory, many=True)
            return Response(serializer.data)
        except Foo.DoesNotExist:
            raise Http404
        
class FoodCartGetPost(APIView):
    permission_classes = [permissions.IsAuthenticated]
    @swagger_auto_schema(
        operation_description="Lấy tất cả sản phẩm có trong giỏ hàng của một User dựa theo Token",
        operation_summary="Lấy tất cả sản phẩm đã có trong giỏ hàng"
    )
    def get(self, request, format=None):
        token = request.headers.get('Authorization').split(' ')[1]
        uid = getUserIdByToken(token=token)
        user = User.objects.all().get(pk = uid)
        foodCart = FooCart.objects.filter(user = user, isOrder = False)
        serializer = FoodCartSerializer(foodCart, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    
    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'product': openapi.Schema(type=openapi.TYPE_NUMBER, description='ID sản phẩm'),
                'user': openapi.Schema(type=openapi.TYPE_NUMBER, description='ID người dùng'),
            },
        ),
        operation_description="Thêm thông tin sản phẩm vào trong giỏ hàng của một User dựa theo Token",
        operation_summary="Thêm sản phẩm mới vào trong giỏ hàng"
    )
    def post(self, request):
        try:
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            request.data["user"] = uid
            try:
                number = FooCart.objects.get(product = request.data["product"]).number
                number = number + 1
                FooCart.objects.filter(product=request.data["product"]).update(number=number)
                return Response({"message" : "Success!"}, status=status.HTTP_201_CREATED)
            except:
                serializer = FoodCartPostSerializer(data=request.data)
                if serializer.is_valid():
                    serializer.save()
                    return Response({"message" : "Success!"}, status=status.HTTP_201_CREATED)
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

class FoodCartPutDelete(APIView):
    permission_classes = [permissions.IsAuthenticated]
    
    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'isOrder': openapi.Schema(type=openapi.TYPE_BOOLEAN, description='Trạng thái đặt hàng của sản phẩm', default=False),
            }
        ),
        operation_description="Cập nhật trạng thái đặt hàng của sản phẩm đã có trong giỏ hàng dựa theo ID",
        operation_summary="Cập nhật trạng thái đặt hàng"
    )
    def put(self, request, pk):
        token = request.headers.get('Authorization').split(' ')[1]
        uid = getUserIdByToken(token=token)
        request.data["user"] = uid
        try:
            if pk is None:
                return Http404
            foodCart = FooCart.objects.get(pk=pk)
            serializer = FoodCartPutSerializer(foodCart, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response({"message" : "Success!"}, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except FooCart.DoesNotExist:
            raise Http404
        
    @swagger_auto_schema(
        operation_description="Xóa thông tin sản phẩm đã có trong giỏ hàng dựa theo ID",
        operation_summary="Xóa sản phẩm đã có trong giỏ hàng"
    )
    def delete(self, request, pk):
        try:
            if pk is None:
                return Http404
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            user = User.objects.all().get(pk = uid)
            foodCart = FooCart.objects.filter(pk=pk, user=user)
            foodCart.delete()
            return Response({'message' : 'Success'},status=status.HTTP_204_NO_CONTENT)
        except FooCart.DoesNotExist:
            raise Http404

class FoodOrder(APIView):
    permission_classes = [permissions.IsAuthenticated]
    user_param = openapi.Parameter('user', openapi.IN_QUERY, description="Id user cần xem chi tiết đơn đặt hàng", type=openapi.TYPE_STRING)
    @swagger_auto_schema(
        operation_description="Lấy tất cả sản phẩm đã được đặt hàng bởi một User",
        operation_summary="Lấy tất cả thông tin các sản phẩm đã được User đặt hàng",
        manual_parameters=[user_param]
    )
    def get(self, request):
        try:
            user = request.query_params.get('user')
            if user is not None:
                user = User.objects.all().get(pk = user)
                foodOrder = FooOrder.objects.filter(user = user, isCancel = False, isReceived = False)
                serializer = FoodOrderGetSerializer(foodOrder, many=True)
                return Response(serializer.data, status=status.HTTP_200_OK)
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            user = User.objects.all().get(pk = uid)
            foodOrder = FooOrder.objects.filter(user = user)
            serializer = FoodOrderGetSerializer(foodOrder, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except FooCart.DoesNotExist:
            raise Http404
    
    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'product': openapi.Schema(type=openapi.TYPE_NUMBER, description='ID sản phẩm cần đặt hàng'),
                'user': openapi.Schema(type=openapi.TYPE_NUMBER, description='ID người dùng'),
                'number': openapi.Schema(type=openapi.TYPE_NUMBER, description='Số lượng sản phẩm cần đặt hàng'),
            },
        ),
        operation_description="Thêm sản phẩm từ giỏ hàng của một User vào trạng thái đặt hàng",
        operation_summary="Đặt hàng một sản phẩm đã có trong giỏ hàng của User"
    )
    def post(self, request,):
        try:
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            request.data["user"] = uid
            product = request.data['product']
            user = User.objects.all().get(pk=request.data["user"])
            FooCart.objects.filter(user=user,product=product).delete()
            serializer = FoodOrderPostSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response({"message" : "Success!"}, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)
        
    @swagger_auto_schema(
        request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            properties={
                'idOrder': openapi.Schema(type=openapi.TYPE_NUMBER, description='ID đơn hàng cần hủy'),
                'user': openapi.Schema(type=openapi.TYPE_NUMBER, description='ID người dùng'),
            },
        ),
        operation_description="Hủy đơn hàng trong bảng Order",
        operation_summary="Hủy một đơn hàng đang được đang được đặt"
    )
    def put(self, request):
        try:
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            request.data["user"] = uid
            idOrder = request.data['idOrder']
            print(idOrder)
            user = User.objects.all().get(pk=request.data["user"])
            if FooOrder.objects.all().filter(user=user, pk=idOrder, isReceived=False).update(isCancel=True):
                return Response({"message" : "Success!"}, status=status.HTTP_200_OK)
            else:
                return Response({"message" : "Failed!"}, status=status.HTTP_406_NOT_ACCEPTABLE)
        except:
            return Response({"message" : "Failed!"}, status=status.HTTP_400_BAD_REQUEST)
            
        
class Delivery(APIView):
    permission_classes = [permissions.IsAuthenticated]
    
    @swagger_auto_schema(
        operation_description="Lấy tất cả thông tin sản phẩm và địa chỉ giao hàng của khách hàng",
        operation_summary="Lấy tất cả thông tin các sản phẩm đã được User đặt hàng và cần giao hàng"
    )
    def get(self, request,):
        try:
            token = request.headers.get('Authorization').split(' ')[1]
            uid = getUserIdByToken(token=token)
            user = User.objects.all().get(pk = uid)
            
            if user.is_superuser == False:
                return Response({"message": "Not Permission!"}, status=status.HTTP_403_FORBIDDEN)
            
            foodOrder = FooOrder.objects.raw('SELECT * FROM api_foodorder WHERE isReceived = 0 AND isCancel = 0 GROUP BY personOrder')
            serializer = FoodOrderGetSerializer(foodOrder, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except FooCart.DoesNotExist:
            raise Http404
        
    

