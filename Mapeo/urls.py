from django.contrib.auth.decorators import login_required
from django.urls import path, include
from Mapeo import views
from Mapeo.views import InicioSesion

app_name = 'mapeo'

urlpatterns = [
    #Urls para usuario
    path('', views.inicio, name='inicio'),
    path('busqueda', views.busqueda_rutas_user, name='busqueda_user'),
    #Url para login y logout
    path('administracion/iniciar-sesion', InicioSesion.as_view(), name='login'),
    path('administracion/cerrar-sesion', views.cerrar_sesion, name='cerrar_sesion'),
    #Url inicio administracion
    path('administracion/inicio', login_required(views.administracion_inicio, login_url='/administracion/iniciar-sesion'), name='administracion-inicio'),
    #Urls para facultades
    path('administracion/facultad', login_required(views.listado_facultad, login_url='/administracion/iniciar-sesion'), name='facultad'),
    path('administracion/facultad/<int:facultad_id>', login_required(views.detalle_facultad, login_url='/administracion/iniciar-sesion'), name='facultad_id'),
    path('administracion/añadir-facultad', login_required(views.anadir_facultad, login_url='/administracion/iniciar-sesion'), name='anadir-facultad'),
    path('administracion/modificar-facultad/<id>/', login_required(views.modificar_facultad, login_url='/administracion/iniciar-sesion'), name='modificar-facultad'),
    path('administracion/eliminar-facultad/<id>/', login_required(views.eliminar_facultad, login_url='/administracion/iniciar-sesion'), name='eliminar-facultad'),
    #Urls para Bloques
    path('administracion/bloque', login_required(views.listado_bloque, login_url='/administracion/iniciar-sesion'), name='bloque'),
    path('administracion/bloque/<int:bloque_id>', login_required(views.detalle_bloque, login_url='/administracion/iniciar-sesion'), name='bloque_id'),
    path('administracion/añadir-bloque', login_required(views.anadir_bloque, login_url='/administracion/iniciar-sesion'), name='anadir-bloque'),
    path('administracion/modificar-bloque/<id>/', login_required(views.modificar_bloque, login_url='/administracion/iniciar-sesion'), name='modificar-bloque'),
    path('administracion/eliminar-bloque/<id>/', login_required(views.eliminar_bloque, login_url='/administracion/iniciar-sesion'), name='eliminar-bloque'),
    #URls para Nodos
    path('administracion/nodo', login_required(views.listado_nodo, login_url='/administracion/iniciar-sesion'), name='nodo'),
    path('administracion/nodo/<int:nodo_id>', login_required(views.detalle_nodo, login_url='/administracion/iniciar-sesion'), name='nodo_id'),
    path('administracion/eliminar-conexion/<id>/', login_required(views.eliminar_conexion, login_url='/administracion/iniciar-sesion'), name='eliminar-conexion'),
    path('administracion/conexion-nodo/<int:nodo_id>/', login_required(views.conexiones_nodo, login_url='/administracion/iniciar-sesion'), name='conexion-nodo'),
    #Url para grafo
    path('administracion/grafo', login_required(views.grafo_admin, login_url='/administracion/iniciar-sesion'), name='grafo'),
    #Urls para usuarios del sistema (administradores)
    path('administracion/administrador', login_required(views.listado_admins, login_url='/administracion/iniciar-sesion'), name='admin'),
    path('administracion/administrador/<int:admin_id>', login_required(views.detalle_admin, login_url='/administracion/iniciar-sesion'), name='admin_id'),
    path('administracion/añadir-administrador', login_required(views.anadir_admin, login_url='/administracion/iniciar-sesion'), name='anadir-admin'),
    path('administracion/modificar-administrador/<id>', login_required(views.modificar_admin, login_url='/administracion/iniciar-sesion'), name='modificar-admin'),
    path('administracion/eliminar-administrador/<id>/', login_required(views.eliminar_admin, login_url='/administracion/iniciar-sesion'), name='eliminar-admin'),
]
