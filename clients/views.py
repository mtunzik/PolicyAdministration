from django.contrib.auth.models import User
from django.db import models
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from .forms import AddClient
from .models import Client
from datetime import datetime


@login_required(login_url='../authentication')
def index(request):
    clients = Client.objects.filter(IsDeleted=False)
    #users = User.objects.filter(is_active=True)
    context = {'clients': clients}
    return render(request, 'index.html', context)


@login_required(login_url='../authentication')
def add(request):
    form = AddClient()
    if request.method == 'POST':
        form = AddClient(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/clients')

    context = {'form': form}
    return render(request, 'client.html', context)


@login_required(login_url='../authentication')
def edit(request, pk):
    client = Client.objects.get(id=pk)
    form = AddClient(instance=client)

    if request.method == 'POST':
        form = AddClient(request.POST, instance=client)
        if form.is_valid():
            client = form.save(commit=False)
            client.DateUpdated = datetime.now()
            client.DateUpdated_id = request.user.id
            client.save()
            return redirect('/clients')

    context = {'form': form, 'clientId': pk}
    return render(request, 'client.html', context)


@login_required(login_url='../authentication')
def delete(request, pk):
    print('Delete Client')
    client = Client.objects.get(id=pk)
    client.IsDeleted = True
    client.DateUpdated = datetime.now()
    client.DateUpdated_id = request.user.id
    client.save()
    print('Client Deleted ' + pk)
    return redirect('/clients')


