# Generated by Django 3.2 on 2021-05-26 00:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='client',
            name='CellNumber',
            field=models.CharField(max_length=12, null=True),
        ),
        migrations.AddField(
            model_name='client',
            name='Email',
            field=models.EmailField(max_length=254, null=True),
        ),
        migrations.AddField(
            model_name='client',
            name='Gender',
            field=models.CharField(choices=[('M', 'Male'), ('F', 'Female')], max_length=6, null=True),
        ),
        migrations.AddField(
            model_name='client',
            name='IDNumber',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='client',
            name='IDType',
            field=models.CharField(choices=[('ID', 'ID'), ('Passport', 'Passport')], max_length=10, null=True),
        ),
        migrations.AddField(
            model_name='client',
            name='Telephone',
            field=models.CharField(max_length=12, null=True),
        ),
        migrations.AddField(
            model_name='client',
            name='Title',
            field=models.CharField(max_length=10, null=True),
        ),
    ]
