from django.shortcuts import render
from django.http import HttpResponse
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import UserSerializer
from django.contrib.auth.models import User

# Create your views here.

class UserList(APIView):
    def get(self, request, format=None):
        users = User.objects.all() # SELECT * FROM User
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)

    