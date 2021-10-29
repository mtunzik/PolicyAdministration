from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from .forms import AddClient
from .models import Client


@login_required(login_url='../authentication')
def index(request):
    clients = Client.objects.all()
    return render(request, 'index.html', {'clients': clients})


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
            form.save()
            return redirect('/clients')

    context = {'form': form}
    return render(request, 'client.html', context)


@login_required(login_url='../authentication')
def delete(request, pk):
    client = Client.objects.get(id=pk)
    client.delete()
    return redirect('/clients')


