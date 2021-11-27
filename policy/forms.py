from django import forms
from .models import *
from products.models import *


class AddPolicy(forms.ModelForm):

    Cover = forms.CharField(
        label='Cover',
        widget=forms.Select(attrs={'class': 'form-control',
                                   'required': 'true'})
    )

    CoverAmount = forms.DecimalField(
        required=False,
        label='Cover Amount',
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'readonly': 'true'})
    )

    class Meta:
        model = Policy
        fields = ['InceptionDate', 'CollectionDay', 'Product', 'Client']
        widgets = {
            'InceptionDate': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'CollectionDay': forms.TextInput(attrs={'class': 'form-control'}),
            'Product': forms.Select(attrs={'class': 'form-control'}),
            'Client': forms.Select(attrs={'class': 'form-control'})
        }
        labels = {
            'InceptionDate': 'Inception Date',
            'CollectionDay': 'Collection Day',
            'Product': 'Product',
            'Client': 'Client'
        }


class AddPolicyVersion(forms.ModelForm):
    Cover = forms.CharField(
        label='Cover',
        widget=forms.Select(attrs={'class': 'form-control',
                                   'required': 'true'})
    )

    CoverAmount = forms.DecimalField(
        required=False,
        label='Cover Amount',
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'readonly': 'true'})
    )

    class Meta:
        model = PolicyVersion
        fields = ['EffectiveDateFrom', 'EndorsementType', 'Description', 'Cover', 'CoverAmount']
        widgets = {
            'EffectiveDateFrom': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'Description': forms.Textarea(attrs={'class': 'form-control'}),
            'EndorsementType': forms.Select(attrs={'class': 'form-control'})
        }
        labels = {
            'EffectiveDateFrom': 'Date Effective From',
            'Description': 'Comment',
            'EndorsementType': 'Endorsement Type'
        }


class AddPolicyMembers(forms.ModelForm):
    Cover = forms.CharField(
        required=False,
        label='Cover',
        widget=forms.Select(attrs={'class': 'form-control'})
    )

    CoverAmount = forms.DecimalField(
        required=False,
        label='Cover Amount',
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'readonly': 'true'})
    )

    class Meta:
        model = PolicyMembers
        fields = ['MemberType', 'First_Name', 'Last_Name', 'Gender', 'DateOfBirth', 'ID_Type', 'ID_Number', 'Title',
                  'Student', 'Cover', 'CoverAmount']
        widgets = {
            'MemberType': forms.Select(attrs={'class': 'form-control'}),
            'First_Name': forms.TextInput(attrs={'class': 'form-control'}),
            'Last_Name': forms.TextInput(attrs={'class': 'form-control'}),
            'Gender': forms.Select(attrs={'class': 'form-control'}),
            'DateOfBirth': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'ID_Type': forms.Select(attrs={'class': 'form-control'}),
            'ID_Number': forms.TextInput(attrs={'class': 'form-control'}),
            'Title': forms.TextInput(attrs={'class': 'form-control'}),
            'Student': forms.CheckboxInput(attrs={'class': 'form-control'})
        }
        labels = {
            'MemberType': 'Member Type',
            'First_Name': 'First Name',
            'Last_Name': 'Last Name',
            'Gender': 'Gender',
            'DateOfBirth': 'Date Of Birth',
            'ID_Type': 'ID Type',
            'ID_Number': 'ID Number',
            'Title': 'Title',
            'Student': 'Student'
        }


