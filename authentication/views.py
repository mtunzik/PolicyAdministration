from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from .forms import RegisterUser
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages


def login_page(request):
    if request.user.is_authenticated:
        return redirect('../policy/')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            print("User is not not none")
            login(request, user)
            print(username)
            return redirect('../policy/')
        else:
            messages.info(request, 'Username or Password does not exist')

    context = {}
    print('It comes here')
    return render(request, 'login.html', context)


def logout_user(request):
    logout(request)
    return redirect('../authentication/')


def register(request):
    if request.user.is_authenticated:
        return redirect('../projects/')
    form = RegisterUser()
    model = User
    if request.method == 'POST':
        form = RegisterUser(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, 'Account created successfully for user: ' + username)
            return redirect('../authentication/')
        else:
            print(form.errors)

    context = {'form': form}
    return render(request, 'register.html', context)


def forgot_password(request):
    return render(request, 'forgot-password.html')