# Generated by Django 4.0.5 on 2022-11-24 09:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Api', '0011_foodorder_phoneorder'),
    ]

    operations = [
        migrations.AddField(
            model_name='food',
            name='popular',
            field=models.BooleanField(default=False),
        ),
    ]
