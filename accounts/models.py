from django.db import models
from clients.models import Client
from policy.models import PolicyLedger


class Receipt(models.Model):
    PAYMENT_METHOD = (
        ('Bank Payment', 'Bank Payment'),
        ('Cash', 'Cash'),
        ('Credit Card', 'Credit Card')
    )
    Amount = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    Date = models.DateField(null=False)
    PaymentMethod = models.CharField(max_length=20, choices=PAYMENT_METHOD, null=True)
    Client = models.ForeignKey(Client, on_delete=models.CASCADE)


class PaymentLedger(models.Model):
    Amount = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    Receipt = models.ForeignKey(Receipt, on_delete=models.CASCADE)
    PolicyLedger = models.ForeignKey(PolicyLedger, on_delete=models.CASCADE)

