from django.http import HttpResponse
from django.shortcuts import render

def inicio(request):
    return render(request, 'pantallas/inicio.html', {})

def pantallaBase(request):
    return render(request, 'pantallas/pantallaBase.html', {})
