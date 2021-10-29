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

    class Meta:
        model = PolicyVersion
        fields = ['EndorsementType', 'EndorsementReason', 'EffectiveDateFrom', 'Description']
        widgets = {
            'EndorsementType': forms.Select(attrs={'class': 'form-control'}),
            'EndorsementReason': forms.TextInput(attrs={'class': 'form-control'}),
            'EffectiveDateFrom': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'Description': forms.Textarea(attrs={'class': 'form-control'})
        }
        labels = {
            'EndorsementType': 'Endorsement Type',
            'EndorsementReason': 'Endorsement Reason',
            'EffectiveDateFrom': 'Date Effective From',
            'Description': 'Comment'
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


