# Generated by Django 4.0 on 2022-01-03 21:45

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('clients', '0005_client_dateofbirth'),
    ]

    operations = [
        migrations.AddField(
            model_name='client',
            name='CreatedBy',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='client_created', to='auth.user'),
        ),
        migrations.AddField(
            model_name='client',
            name='DateUpdated',
            field=models.DateTimeField(blank=True, default=datetime.datetime.now),
        ),
        migrations.AddField(
            model_name='client',
            name='IsDeleted',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='client',
            name='UpdatedBy',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='client_updated', to='auth.user'),
        ),
        migrations.AddField(
            model_name='client',
            name='client_created',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='client',
            name='ID_Number',
            field=models.CharField(max_length=20, null=True, unique=True),
        ),
    ]
