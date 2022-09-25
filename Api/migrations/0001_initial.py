# Generated by Django 4.0.5 on 2022-09-23 13:50

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='FoodCategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('slug', models.SlugField(blank=True, null=True, unique=True)),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Food',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('price', models.DecimalField(decimal_places=3, max_digits=10)),
                ('price_sale', models.DecimalField(decimal_places=3, max_digits=10)),
                ('image', models.ImageField(upload_to='uploads/')),
                ('image1', models.ImageField(blank=True, null=True, upload_to='uploads/')),
                ('image2', models.ImageField(blank=True, null=True, upload_to='uploads/')),
                ('image3', models.ImageField(blank=True, null=True, upload_to='uploads/')),
                ('timeUpload', models.DateTimeField(blank=True, default=datetime.datetime.now)),
                ('isProduct', models.BooleanField(default=True)),
                ('slug', models.SlugField(blank=True, null=True, unique=True)),
                ('category', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Api.foodcategory')),
            ],
        ),
    ]