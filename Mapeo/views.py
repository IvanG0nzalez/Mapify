import base64
import io

import matplotlib.pyplot as plt
import networkx as nx
from django.contrib.auth.models import User
from django.contrib.auth.views import LoginView
from django.contrib.auth import login, logout
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
from django.http import HttpResponseRedirect
from Mapeo.forms import RegistroAdminForm, BloqueForm
from Mapeo.graph_controller import ControladorGrafo
from Mapeo.models import Bloque


def inicio(request):
    return render(request, 'pantallas/inicio.html', {})

def pantallaBase(request):
    return render(request, 'pantallas/base.html', {})

def administracion_inicio(request):
    return render(request, 'pantallas/inicio_admin.html', {})


def listado_bloque(request):
    bloques = Bloque.obtener_bloques()
    context={
        'bloques': bloques,
    }
    return render(request, 'pantallas/listado_bloque.html', context)


def detalle_bloque(request, bloque_id):
    bloque = get_object_or_404(Bloque, pk=bloque_id)
    context={
        'bloque': bloque,
    }
    return render(request, 'pantallas/detalle_bloque.html', context)


def modificar_bloque(request, id):
    bloque = get_object_or_404(Bloque, id=id)
    data = {
        'form': BloqueForm(instance=bloque)
    }
    if request.method == 'POST':
        formulario = BloqueForm(data=request.POST, instance=bloque)

        if formulario.is_valid():
            formulario.save()
            return redirect("mapeo:bloque")
        data["form"] = formulario
    return render(request, 'pantallas/modificar_bloque.html', data)


def eliminar_bloque(request, id):
    bloque = get_object_or_404(Bloque, id=id)
    bloque.delete()
    return redirect('mapeo:bloque')


def anadir_bloque(request):
    return render(request, 'pantallas/anadir_bloque.html', {})


def busqueda_rutas_user(request):
    return render(request, 'pantallas/busqueda.html', {})


def listado_nodo(request):
        return render(request, 'pantallas/nodo.html', {})


def detalle_nodo(request):
    return render(request, 'pantallas/detalle_nodo.html', {})


def conexiones_bloque(request):
    return render(request, 'pantallas/conexiones_bloque.html', {})


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


def listado_admins(request):
    admins = User.objects.all()
    return render(request, 'pantallas/listado_admins.html', {'admins': admins})


def crear_admin(request):
    if request.method == 'POST':
        form = RegistroAdminForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            password = form.cleaned_data['password']
            user.set_password(password)
            user.is_staff = True
            user.save()
            return redirect('listar-admins')
    else:
        form = RegistroAdminForm()
    return render(request, 'pantallas/crear_admin.html', {'form': form})


class InicioSesion(LoginView):
    template_name = 'pantallas/inicio_sesion.html'
    redirect_authenticated_user = True

    @method_decorator(never_cache)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        usuario = form.get_user()
        if usuario.is_active and usuario.is_staff:
            login(self.request, usuario)
            return HttpResponseRedirect(self.get_success_url())
        else:
            return self.form_invalid(form)

    def get_success_url(self):
        return reverse_lazy('mapeo:administracion-inicio')


def cerrar_sesion(request):
    logout(request)
    return redirect("mapeo:login")
