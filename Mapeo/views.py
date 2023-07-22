import base64
import io

import matplotlib.pyplot as plt
import networkx as nx
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView

from Mapeo.forms import FormularioCrearUsuario
from Mapeo.graph_controller import ControladorGrafo
from Mapeo.models import Usuario


def inicio(request):
    return render(request, 'pantallas/inicio.html', {})

def pantallaBase(request):
    return render(request, 'pantallas/base.html', {})

def administracion_inicio(request):
    return render(request, 'pantallas/inicio_admin.html', {})

def administracion_bloque(request):
    return render(request, 'pantallas/bloque_admin.html', {})

def administracion_detalle_bloque(request):
    return render(request, 'pantallas/detalle_bloque_admin.html', {})

def administracion_anadir_bloque(request):
    return render(request, 'pantallas/anadir_bloque_admin.html', {})

def administracion_modificar_bloque(request):
    return render(request, 'pantallas/modificar_bloque_admin.html', {})

def busqueda_rutas_user(request):
    return render(request, 'pantallas/busqueda.html', {})


def grafo_admin(request):
    controlador_grafo = ControladorGrafo()
    controlador_grafo.crear_grafo()

    grafo = controlador_grafo.obtener_grafo()
    print(grafo)
    pos = nx.spring_layout(grafo, seed=42)
    plt.figure(figsize=(10, 6))

    nx.draw(grafo, pos, with_labels=True, node_color='skyblue', node_size=2000, font_size=10, font_weight='bold')
    etiquetas_aristas_distancia = nx.get_edge_attributes(grafo, 'distancia')
    etiquetas_aristas_tiempo = nx.get_edge_attributes(grafo, 'tiempo')

    etiquetas_combinadas = {
        arista: f"Dist: {etiquetas_aristas_distancia[arista]}, Tiempo: {etiquetas_aristas_tiempo[arista]}"
        for arista in grafo.edges()
    }

    nx.draw_networkx_edge_labels(grafo, pos, edge_labels=etiquetas_combinadas, font_size=8)

    buf = io.BytesIO()
    plt.savefig(buf, format='png')
    buf.seek(0)

    imagen_base64 = base64.b64encode(buf.read()).decode('utf-8')

    return render(request, 'pantallas/grafo_admin.html', {'imagen': imagen_base64})
    #return render(request, 'pantallas/grafo_admin.html', {})


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


class ListadoUsuario(ListView):
    model = Usuario
    template_name = 'pantallas/listado_admins.html'

    def get_queryset(self):
        return self.model.objects.filter(is_activo=True)


class CrearUsuario(CreateView):
    model = Usuario
    form_class = FormularioCrearUsuario
    template_name = 'pantallas/crear_admin.html'
    success_url = reverse_lazy('administracion-inicio')
