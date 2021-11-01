from django import forms
from .models import Client


class AddClient(forms.ModelForm):
    Telephone = forms.CharField(
        required=False,
        label='Telephone',
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )

    Email = forms.CharField(
        required=False,
        label='Email',
        widget=forms.EmailInput(attrs={'class': 'form-control'})
    )

    class Meta:
        model = Client
        fields = ['First_Name', 'Last_Name', 'Gender', 'DateOfBirth', 'ID_Type', 'ID_Number', 'Title', 'Telephone', 'Cell_Number',
                  'Email']
        widgets = {
            'First_Name': forms.TextInput(attrs={'class': 'form-control'}),
            'Last_Name': forms.TextInput(attrs={'class': 'form-control'}),
            'Gender': forms.Select(attrs={'class': 'form-control'}),
            'DateOfBirth': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'ID_Type': forms.Select(attrs={'class': 'form-control'}),
            'ID_Number': forms.TextInput(attrs={'class': 'form-control'}),
            'Title': forms.TextInput(attrs={'class': 'form-control'}),
            'Cell_Number': forms.TextInput(attrs={'class': 'form-control'})
        }
        labels = {
            'First_Name': 'First Name',
            'Last_Name': 'Last Name',
            'Gender': 'Gender',
            'DateOfBirth': 'Date Of Birth',
            'ID_Type': 'ID Type',
            'ID_Number': 'ID Number',
            'Title': 'Title',
            'Telephone': 'Telephone',
            'Cell_Number': 'Cell Number',
            'Email': 'Email'
        }


