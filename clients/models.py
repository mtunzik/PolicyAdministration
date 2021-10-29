from datetime import datetime
from django.db import models


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
    ID_Number = models.CharField(max_length=20, null=True)
    Title = models.CharField(max_length=10, null=True)
    Telephone = models.CharField(max_length=12, null=True)
    Cell_Number = models.CharField(max_length=12, null=True)
    Email = models.EmailField(null=True)
    DateAdded = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.First_Name + ' ' + self.Last_Name


