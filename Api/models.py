from django.db import models
from datetime import datetime
from django.contrib.auth.models import User
from django.utils.text import slugify 


class Person(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    avatar = models.ImageField(upload_to ='uploads_avatar/', default='uploads_avatar/default.png')
    money = models.DecimalField(max_digits=10, decimal_places=3, default=0)
    phone = models.CharField(max_length=11)
    address = models.CharField(max_length=255)
    def __str__(self):
       return self.user.username
    
    
class FoodCategory(models.Model):
    name = models.CharField(max_length=255)
    slug = models.SlugField(unique=True, blank=True, null=True)
    description = models.TextField()
    image = models.ImageField(upload_to ='uploads/', blank=True, null=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(FoodCategory, self).save(*args, **kwargs)

    def __str__(self):
        return self.name


class Food(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=3)
    price_sale = models.DecimalField(max_digits=10, decimal_places=3)
    image = models.ImageField(upload_to ='uploads/')
    image1 = models.ImageField(upload_to ='uploads/', blank=True, null=True)
    image2 = models.ImageField(upload_to ='uploads/', blank=True, null=True)
    image3 = models.ImageField(upload_to ='uploads/', blank=True, null=True) 
    isProduct = models.BooleanField(default=True)
    category = models.ForeignKey(FoodCategory, on_delete=models.CASCADE, blank=True, null=True)
    slug = models.SlugField(unique=True, blank=True, null=True)
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Food, self).save(*args, **kwargs)

    def __str__(self):
        return self.name
    
class FoodCart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Food, on_delete=models.CASCADE, blank= True, null= True)
    name = models.CharField(max_length=255, blank= True, null= True)
    image = models.ImageField(upload_to ='uploads/', blank= True, null= True)
    price = models.DecimalField(max_digits=10, decimal_places=3, default=0)
    addCart = models.BooleanField(default=False)
    isOrder = models.BooleanField(default=False)
    number = models.IntegerField(default=1)
    def save(self, *args, **kwargs):
        food = Food.objects.all().get(name=self.product)
        self.name = food.name
        self.image = food.image 
        self.price = food.price
        super(FoodCart, self).save(*args, **kwargs)
    def __str__(self):
        return self.user.username

class FoodOrder(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Food, on_delete=models.CASCADE, blank= True, null= True)
    personOrder = models.CharField(max_length=255)
    addressOrder = models.CharField(max_length=255);
    timeOrder = models.DateTimeField(default=datetime.now, blank=True)
    name = models.CharField(max_length=255, blank= True, null= True)
    image = models.ImageField(upload_to ='uploads/', blank= True, null= True)
    price = models.DecimalField(max_digits=10, decimal_places=3, default=0)
    isReceived = models.BooleanField(default=False)
    number = models.IntegerField(default=1)
    phoneOrder = models.CharField(max_length=11, default=0)
    def save(self, *args, **kwargs):
        food = Food.objects.all().get(name=self.product)
        self.name = food.name
        self.image = food.image 
        self.price = food.price
        
        userOrder = User.objects.all().get(username=self.user)
        person = Person.objects.all().get(user=userOrder)
        self.personOrder = userOrder.first_name + " " + userOrder.last_name
        self.addressOrder = person.address
        self.phoneOrder = person.phone
         
        super(FoodOrder, self).save(*args, **kwargs)
    def __str__(self):
        return self.user.username