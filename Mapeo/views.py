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
from Mapeo.forms import RegistroAdminForm, BloqueForm, ModificarAdminForm, FacultadForm
from Mapeo.graph_controller import ControladorGrafo
from Mapeo.models import Bloque, Ruta, Nodo, Facultad


def inicio(request):
    return render(request, 'pantallas/inicio.html', {})

def pantallaBase(request):
    return render(request, 'pantallas/base.html', {})

def administracion_inicio(request):
    return render(request, 'pantallas/inicio_admin.html', {})


def listado_facultad(request):
    facultades = Facultad.obtener_facultades()
    context={
        'facultades': facultades,
    }
    return render(request, 'pantallas/listado_facultad.html', context)


def detalle_facultad(request, facultad_id):
    facultad = get_object_or_404(Facultad, pk=facultad_id)
    bloques = facultad.bloques.all()
    context = {
        'facultad': facultad,
        'bloques': bloques
    }
    return render(request, 'pantallas/detalle_facultad.html', context)


def modificar_facultad(request, id):
    facultad = get_object_or_404(Facultad, id=id)
    data = {
        'form': FacultadForm(instance=facultad),
        'facultad_id': id
    }
    if request.method == 'POST':
        formulario = FacultadForm(data=request.POST, instance=facultad)

        if formulario.is_valid():
            formulario.save()
            return redirect("mapeo:facultad")
        data["form"] = formulario
    return render(request, 'pantallas/modificar_facultad.html', data)


def eliminar_facultad(request, id):
    facultad = get_object_or_404(Facultad, id=id)
    facultad.delete()
    return redirect('mapeo:facultad')


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
        'form': BloqueForm(instance=bloque),
        'bloque_id': id
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
    data={
        'form': BloqueForm()
    }
    if request.method == 'POST':
        formulario = BloqueForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
            return redirect('mapeo:bloque')
        else:
            data["form"] = formulario
    return render(request, 'pantallas/anadir_bloque.html', data)


def listado_nodo(request):
    nodos = Nodo.obtener_nodos()
    context = {
        'nodos': nodos,
    }
    return render(request, 'pantallas/listado_nodo.html', context)


def detalle_nodo(request, nodo_id):
    nodo = get_object_or_404(Nodo, pk=nodo_id)
    context = {
        'nodo': nodo,
    }
    return render(request, 'pantallas/detalle_nodo.html', context)


def conexiones_nodo(request, nodo_id):
    nodo = get_object_or_404(Nodo, pk=nodo_id)
    nodos = Bloque.objects.exclude(id=nodo_id)
    rutas = Ruta.objects.filter(nodo_inicio=nodo)

    if request.method == 'POST':
        nodo_destino_id = request.POST.get('nodo_destino')
        nodo_destino = get_object_or_404(Nodo, id=nodo_destino_id)

        nueva_ruta = Ruta.objects.create(nodo_inicio=nodo, nodo_destino=nodo_destino)
        return redirect('mapeo:conexion-nodo', nodo_id=nodo_id)
    context = {
        'nodos': nodos,
        'nodo': nodo,
        'rutas': rutas,
    }
    return render(request, 'pantallas/conexiones_nodo.html', context)


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


def listado_admins(request):
    admins = User.objects.all()
    return render(request, 'pantallas/listado_admins.html', {'admins': admins})


def detalle_admin(request, admin_id):
    admin = get_object_or_404(User, pk=admin_id)
    context={
        'admin': admin,
    }
    return render(request, 'pantallas/detalle_admin.html', context)


def anadir_admin(request):
    if request.method == 'POST':
        form = RegistroAdminForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            password = form.cleaned_data['password']
            user.set_password(password)
            user.is_staff = True
            user.save()
            return redirect('mapeo:admin')
    else:
        form = RegistroAdminForm()
    return render(request, 'pantallas/anadir_admin.html', {'form': form})


def modificar_admin(request, id):
    admin = get_object_or_404(User, id=id)

    if request.method == 'POST':
        form = ModificarAdminForm(request.POST, instance=admin)
        if form.is_valid():
            form.save()
            return redirect('admin')
    else:
        form = ModificarAdminForm(instance=admin)
    return render(request, 'pantallas/modificar_admin.html', {'form': form, 'admin_id': id})


def eliminar_admin(request, id):
    admin = get_object_or_404(User, id=id)
    admin.delete()
    return redirect('admin')


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
