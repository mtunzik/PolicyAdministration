from django.db import models
from django.db.models.fields.related import ManyToManyField
from clients.models import Client
from products.models import Product, ProductRates
from datetime import datetime
from django.utils import timezone
from django.contrib.auth.models import User


class Policy(models.Model):
    Number = models.CharField(max_length=20)
    InceptionDate = models.DateField(blank=False)
    CollectionDay = models.IntegerField(null=False)
    Product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='product')
    Client = models.ForeignKey(Client, on_delete=models.CASCADE, related_name='client')
    DateAdded = models.DateTimeField(default=timezone.now, blank=False)


class PolicyVersion(models.Model):
    ENDORSEMENT_TYPE = (
        ('Inception', 'Inception'),
        ('Internal', 'Internal'),
        ('Endorsement', 'Endorsement'),
        ('Cancellation', 'Cancellation')
    )
    STATUS = (
        ('Un-finalised', 'Un-finalised'),
        ('Finalised', 'Finalised'),
        ('Declined', 'Declined')
    )

    COVER_OPTION = (
        ('6 Members', '6 Members'),
        ('8 Members', '8 Members'),
        ('10 Members', '10 Members'),
        ('Option 1: R 5,000', 'Option 1: R 5,000'),
        ('Option 2: R 10,000', 'Option 2: R 10,000'),
        ('Price Per R 1,000', 'Price Per R 1,000')
    )

    Version_Number = models.IntegerField(default=1)
    EndorsementType = models.CharField(max_length=20, choices=ENDORSEMENT_TYPE)
    EndorsementReason = models.CharField(max_length=255)
    EffectiveDateFrom = models.DateField(blank=False)
    EffectiveDateTo = models.DateField(blank=False)
    Description = models.CharField(max_length=255)
    Cover = models.CharField(max_length=50, choices=COVER_OPTION, null=True)
    CoverAmount = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    IsLatest = models.BooleanField(default=True)
    Status = models.CharField(max_length=20, choices=STATUS, default='Un-finalised')
    DateAdded = models.DateTimeField(default=timezone.now, blank=False)
    CreatedBy = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_created')
    ApprovedBy = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='user_approved')
    DeclinedBy = models.ForeignKey(User, on_delete=models.CASCADE, null=True, related_name='user_declined')
    Policy = models.ForeignKey('Policy', on_delete=models.CASCADE)


class PolicyMembers(models.Model):
    GENDER = (
        ('M', 'Male'),
        ('F', 'Female')
    )

    IDTYPE = (
        ('ID', 'ID'),
        ('Passport', 'Passport')
    )

    MEMBER_TYPE = (
        ('Main Member', 'Main Member'),
        ('Spouse', 'Spouse'),
        ('Child', 'Child'),
        ('Adult Dependent', 'Adult Dependent')
    )

    MemberType = models.CharField(max_length=20, choices=MEMBER_TYPE)
    First_Name = models.CharField(max_length=250)
    Last_Name = models.CharField(max_length=250)
    Gender = models.CharField(max_length=6, choices=GENDER, null=True)
    DateOfBirth = models.DateField(default=timezone.now, blank=False)
    ID_Type = models.CharField(max_length=10, choices=IDTYPE, null=True)
    ID_Number = models.CharField(max_length=20, null=True)
    Title = models.CharField(max_length=10, null=True)
    PolicyVersion = models.ForeignKey('PolicyVersion', on_delete=models.CASCADE)
    Student = models.BooleanField(null=True)
    Cover = models.CharField(max_length=50, null=True)
    CoverAmount = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    Premium = models.DecimalField(max_digits=8, decimal_places=2)
    DateAdded = models.DateTimeField(default=timezone.now, blank=False)
   


class PolicyLedger(models.Model):
    Amount = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    TransactionDate = models.DateField(null=False)
    CollectionDate = models.DateField(null=False)
    PolicyVersion = models.ForeignKey('PolicyVersion', on_delete=models.CASCADE)
    








