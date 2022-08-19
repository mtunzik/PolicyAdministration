from datetime import datetime
from django.db import models
from django.contrib.auth.models import User
from django.db.models.fields.related import ManyToManyField, OneToOneField


class Client(models.Model):
    GENDER = (
        ('M', 'Male'),
        ('F', 'Female')
    )

    IDTYPE = (
        ('ID', 'ID'),
        ('Passport', 'Passport')
    )
    First_Name = models.CharField(max_length=250)
    Last_Name = models.CharField(max_length=250)
    Gender = models.CharField(max_length=6, choices=GENDER, null=True)
    DateOfBirth = models.DateField(default=datetime.now, blank=False)
    ID_Type = models.CharField(max_length=10, choices=IDTYPE, null=True)
    ID_Number = models.CharField(max_length=20, null=True, unique=True)
    Title = models.CharField(max_length=10, null=True)
    Telephone = models.CharField(max_length=12, null=True)
    Cell_Number = models.CharField(max_length=12, null=True)
    Email = models.EmailField(null=True)
    IsDeleted = models.BooleanField(default=False)
    DateAdded = models.DateTimeField(default=datetime.now, blank=True)
    CreatedBy = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='client_created')
    DateUpdated = models.DateTimeField(default=datetime.now, blank=True)
    UpdatedBy = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='client_updated')
   
   # client_created = models.ManyToManyField(User)
    

    def __str__(self):
        return self.First_Name + ' ' + self.Last_Name


