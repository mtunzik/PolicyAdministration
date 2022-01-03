from django.contrib.auth.decorators import login_required
from django.http.response import HttpResponse
from django.shortcuts import render

# Create your views here.

@login_required(login_url='../authentication')
def user_profile(request):
    return render(request, 'user-profile.html')