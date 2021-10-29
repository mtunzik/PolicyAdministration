from datetime import datetime
from django.db import models


class Product(models.Model):
    Name = models.CharField(max_length=255)
    Code = models.CharField(max_length=10)
    MaxNonPayments = models.IntegerField
    isActive = models.BooleanField(default=True)
    DateAdded = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.Name


class ProductRates(models.Model):
    Description = models.CharField(max_length=255)
    AgeFrom = models.IntegerField(blank=True, null=True)
    AgeTo = models.IntegerField(blank=True, null=True)
    Cover = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    Rate = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    isActive = models.BooleanField(default=True)
    Product = models.ForeignKey('Product', on_delete=models.CASCADE)
    DateAdded = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.Description



