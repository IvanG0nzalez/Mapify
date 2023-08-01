import json
import os.path

from django.contrib.auth.models import User
from django.contrib.auth.views import LoginView
from django.contrib.auth import login, logout
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
from django.http import HttpResponseRedirect
from Mapeo.forms import RegistroAdminForm, BloqueForm, ModificarAdminForm, FacultadForm
from Mapeo.graph_controller import ControladorGrafo, NodoNoExisteException
from Mapeo.models import Bloque, Ruta, Nodo, Facultad

controlador_grafo = ControladorGrafo()

def inicio(request):
    return render(request, 'pantallas/inicio.html', {})


def administracion_inicio(request):
    return render(request, 'pantallas/inicio_admin.html', {})


def busqueda_rutas_user(request):
    nodos = Nodo.objects.exclude(codigo__startswith='N')
    if request.method == 'POST':
        nodo_origen_codigo = request.POST.get('bloque_origen')
        nodo_destino_codigo = request.POST.get('bloque_destino')

        controlador_grafo.obtener_grafo()

        try:
            # Calcular el camino mínimo a partir del origen seleccionado
            rutas = controlador_grafo.minimo_dijkstra(nodo_origen_codigo)
            # Obtener el camino más corto del diccionario 'rutas' que coincida con el codigo del nodo destino
            camino_mas_corto = rutas.get(nodo_destino_codigo)
            # Si el camino existe se extraen las coordenadas de los nodos del camino y los bloques correspondientes a los mismos
            if camino_mas_corto:
                nodos_camino = camino_mas_corto['ruta']
                #variable para almacenar las coordenadas del camino
                coordenadas_nodos = []

                distancia = camino_mas_corto['distancia']
                tiempo = camino_mas_corto['tiempo']
                tiempo_formateado = format_tiempo(tiempo)
                #Variable para almacenar los bloques del camino
                bloques_camino = []
                # Obtener los Bloques y coordenadas de los nodos del camino recuperados del djikstra
                for codigo_nodo in nodos_camino:
                    #Recuperación de coords
                    coordenadas = controlador_grafo.obtener_coordenadas_por_codigo(codigo_nodo)
                    if coordenadas:
                        coordenadas_nodos.append(coordenadas)
                    try:
                        bloque = Nodo.objects.get(codigo=codigo_nodo)
                        bloques_camino.append(bloque)
                    except Nodo.DoesNotExist:
                        print(f"El nodo con código {codigo_nodo} no existe")
                        pass

                # Convertir la lista de coordenadas a una lista de diccionarios
                coordenadas_nodos_dict = [{"lat": lat, "lng": lng} for lat, lng in coordenadas_nodos]

                return render(request, 'pantallas/busqueda.html', {'ruta_coordenadas': coordenadas_nodos_dict, 'nodos': nodos, 'distancia': distancia, 'tiempo': tiempo_formateado, 'bloques_camino': bloques_camino})
            else:
                print("El nodo no existe")
                pass
        except NodoNoExisteException as e:
            print(f"El nodo no existe: {e}")
            pass
    else:
        return render(request, 'pantallas/busqueda.html', {'nodos': nodos})


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
        formulario = FacultadForm(data=request.POST, files=request.FILES, instance=facultad)

        if formulario.is_valid():
            formulario.save()
            return redirect("mapeo:facultad_id", id)
        data["form"] = formulario
    return render(request, 'pantallas/modificar_facultad.html', data)


def listado_modificar_facultad(request, id):
    facultad = get_object_or_404(Facultad, id=id)
    data = {
        'form': FacultadForm(instance=facultad),
        'facultad_id': id
    }
    if request.method == 'POST':
        formulario = FacultadForm(data=request.POST, files=request.FILES, instance=facultad)

        if formulario.is_valid():
            formulario.save()
            return redirect("mapeo:facultad")
        data["form"] = formulario
    return render(request, 'pantallas/listado_modificar_facultad.html', data)


def eliminar_facultad(request, id):
    facultad = get_object_or_404(Facultad, id=id)
    #Obtener la ruta del archivo de la imagen
    if facultad.imagen:
        ruta_imagen = facultad.imagen.path
        #Eliminar la imagen del sistema de archivos
        if os.path.exists(ruta_imagen):
            os.remove(ruta_imagen)
    facultad.delete()
    return redirect('mapeo:facultad')


def anadir_facultad(request):
    if request.method == 'POST':
        formulario = FacultadForm(request.POST, request.FILES)
        if formulario.is_valid():
            formulario.save()
            return redirect('mapeo:facultad')
    else:
        formulario = FacultadForm()

    data = {
        'form': formulario
    }
    return render(request, 'pantallas/anadir_facultad.html', data)


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
            return redirect("mapeo:bloque_id", id)
        data["form"] = formulario
    return render(request, 'pantallas/modificar_bloque.html', data)


def listado_modificar_bloque(request, id):
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
    return render(request, 'pantallas/listado_modificar_bloque.html', data)


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


def eliminar_conexion(request, id):
    ruta = get_object_or_404(Ruta, id=id)
    nodo_id = ruta.nodo_inicio.id
    ruta.delete()
    return redirect('mapeo:conexion-nodo', nodo_id=nodo_id)


def conexiones_nodo(request, nodo_id):
    nodo = get_object_or_404(Nodo, pk=nodo_id)
    rutas = Ruta.objects.filter(nodo_inicio=nodo)

    if request.method == 'POST':
        nodo_destino_id = request.POST.get('nodo_destino')
        nodo_destino = get_object_or_404(Nodo, id=nodo_destino_id)
        Ruta.objects.create(nodo_inicio=nodo, nodo_destino=nodo_destino)
        return redirect('mapeo:conexion-nodo', nodo_id=nodo_id)
    #Obtiene los nodos ya conectados al nodo actual
    nodos_conectados = Nodo.objects.filter(Rutas_Destino__nodo_inicio=nodo)
    #Excluir los nodos conectados del conjunto de nodos disponibles para conectar
    nodos = Nodo.objects.exclude(id=nodo_id).exclude(id__in=nodos_conectados)

    context = {
        'nodos': nodos,
        'nodo': nodo,
        'rutas': rutas,
    }
    return render(request, 'pantallas/conexiones_nodo.html', context)


def listado_conexiones_nodo(request, nodo_id):
    nodo = get_object_or_404(Nodo, pk=nodo_id)
    rutas = Ruta.objects.filter(nodo_inicio=nodo)

    if request.method == 'POST':
        nodo_destino_id = request.POST.get('nodo_destino')
        nodo_destino = get_object_or_404(Nodo, id=nodo_destino_id)
        Ruta.objects.create(nodo_inicio=nodo, nodo_destino=nodo_destino)
        return redirect('mapeo:listado-conexion-nodo', nodo_id=nodo_id)
    #Obtiene los nodos ya conectados al nodo actual
    nodos_conectados = Nodo.objects.filter(Rutas_Destino__nodo_inicio=nodo)
    #Excluir los nodos conectados del conjunto de nodos disponibles para conectar
    nodos = Nodo.objects.exclude(id=nodo_id).exclude(id__in=nodos_conectados)

    context = {
        'nodos': nodos,
        'nodo': nodo,
        'rutas': rutas,
    }
    return render(request, 'pantallas/listado_conexiones_nodo.html', context)


def grafo_admin(request):
    grafo = controlador_grafo.obtener_grafo()

    grafo_data_json = []

    if grafo:
        grafo_data = {
            'nodes': [{'id': str(nodo), 'label': f'Bloque {nodo}', 'codigo': 'Codigo nodo: XYZ'} for nodo in grafo.nodes()],
            'edges': [{'from': str(arista[0]), 'to': str(arista[1]),
                       'label': f'Distancia: {grafo[arista[0]][arista[1]]["distancia"]} mts\nTiempo: {format_tiempo(grafo[arista[0]][arista[1]]["tiempo"])}'}
                      for arista in grafo.edges()]
        }

        grafo_data_json = json.dumps(grafo_data)

        return render(request, 'pantallas/grafo_admin.html', {'grafo_data': grafo_data_json})
    else:
        return render(request, 'pantallas/grafo_admin.html', {'grafo_data': grafo_data_json})


def format_tiempo(tiempo_segundos):
    tiempo_minutos, tiempo_segundos = divmod(tiempo_segundos, 60)
    return f"{tiempo_minutos} minutos y {tiempo_segundos} segundos"


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
            return redirect('mapeo:admin_id', id)
    else:
        form = ModificarAdminForm(instance=admin)
    return render(request, 'pantallas/modificar_admin.html', {'form': form, 'admin_id': id})


def listado_modificar_admin(request, id):
    admin = get_object_or_404(User, id=id)

    if request.method == 'POST':
        form = ModificarAdminForm(request.POST, instance=admin)
        if form.is_valid():
            form.save()
            return redirect('admin')
    else:
        form = ModificarAdminForm(instance=admin)
    return render(request, 'pantallas/listado_modificar_admin.html', {'form': form, 'admin_id': id})


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
