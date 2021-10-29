from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm


class RegisterUser(UserCreationForm):
    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control',
                                          'required': 'true',
                                          'placeholder': 'Password',
                                          })
    )
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control',
                                          'type': 'password',
                                          'required': 'true',
                                          'placeholder': 'Repeat Password'
                                          })
    )

    first_name = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'type': 'text',
                                      'required': 'true',
                                      })
    )

    username = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'type': 'text',
                                      'required': 'true',
                                      })
    )

    last_name = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'type': 'text',
                                      'required': 'true',
                                      })
    )

    email = forms.EmailField(
        widget=forms.TextInput(attrs={'class': 'form-control',
                                      'type': 'email',
                                      'placeholder': 'Email address',
                                      'required': 'true'
                                      })
    )

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email']
