from django import forms
from .models import *


class AddPayment(forms.ModelForm):
    class Meta:
        model = Receipt
        fields = ['Amount', 'Date', 'PaymentMethod']
        widgets = {
            'Amount': forms.TextInput(attrs={'class': 'form-control'}),
            'Date': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'PaymentMethod': forms.Select(attrs={'class': 'form-control'})
        }
        labels = {
            'Date': 'Payment Date',
            'PaymentMethod': 'Payment Method'
        }
