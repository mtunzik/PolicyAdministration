# Generated by Django 3.2 on 2021-08-15 21:06

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0004_auto_20210527_0253'),
    ]

    operations = [
        migrations.AddField(
            model_name='client',
            name='DateOfBirth',
            field=models.DateField(default=datetime.datetime.now),
        ),
    ]
