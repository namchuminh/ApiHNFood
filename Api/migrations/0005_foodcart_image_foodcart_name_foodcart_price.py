# Generated by Django 4.0.5 on 2022-10-22 07:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Api', '0004_foodcategory_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='foodcart',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='uploads/'),
        ),
        migrations.AddField(
            model_name='foodcart',
            name='name',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='foodcart',
            name='price',
            field=models.DecimalField(decimal_places=3, default=0, max_digits=10),
        ),
    ]