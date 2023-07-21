from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages

def inicio(request):
    return render(request, 'pantallas/inicio.html', {})

def pantallaBase(request):
    return render(request, 'pantallas/base.html', {})

def administracion_inicio(request):
    return render(request, 'pantallas/inicio_admin.html', {})

def busqueda_rutas_user(request):
    return render(request, 'pantallas/busqueda.html', {})

def grafo_admin(request):
    return render(request, 'pantallas/grafo_admin.html', {})


def iniciar_sesion(request):
    if request.method == "POST":
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            usuario = form.cleaned_data.get('username')
            contrasenia = form.cleaned_data.get('password')
            user = authenticate(username=usuario, password=contrasenia)
            if user is not None:
                login(request, user)
                return redirect("administracion-inicio")
            else:
                messages.error(request, 'Usuario o contraseña equivocada')
        else:
            messages.error(request, 'Usuario o contraseña equivocada')

    form = AuthenticationForm()
    return render(request, 'pantallas/inicio_sesion.html', {"form": form})


def cerrar_sesion(request):
    logout(request)
    messages.info(request, "Saliste de la sesión")
    return redirect("login")