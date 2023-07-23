from django.contrib.auth.decorators import login_required
from django.urls import path, include
from Mapeo import views
#from Mapeo.views import ListadoUsuario, CrearUsuario, InicioSesion
from Mapeo.views import InicioSesion

app_name = 'mapeo'

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('busqueda', views.busqueda_rutas_user, name='busqueda_user'),
    path('administracion/iniciar-sesion', InicioSesion.as_view(), name='login'),
    path('administracion/inicio', login_required(views.administracion_inicio, login_url='/administracion/iniciar-sesion'), name='administracion-inicio'),
    path('administracion/bloque', login_required(views.listado_bloque, login_url='/administracion/iniciar-sesion'), name='bloque'),
    path('administracion/bloque/<int:bloque_id>', login_required(views.bloque_info, login_url='/administracion/iniciar-sesion'), name='bloque_id'),
    path('administracion/detalle-bloque', login_required(views.administracion_detalle_bloque, login_url='/administracion/iniciar-sesion'), name='detalle-bloque'),
    path('administracion/anadir-bloque', login_required(views.administracion_anadir_bloque, login_url='/administracion/iniciar-sesion'), name='anadir-bloque'),
    path('administracion/modificar-bloque/<id>/', login_required(views.modificar_bloque, login_url='/administracion/iniciar-sesion'), name='modificar-bloque'),
    path('administracion/cerrar-sesion', views.cerrar_sesion, name='cerrar_sesion'),
    path('administracion/grafo', login_required(views.grafo_admin, login_url='/administracion/iniciar-sesion'), name='grafo'),
    path('administracion/nodo', login_required(views.administracion_nodo, login_url='/administracion/iniciar-sesion'), name='nodo'),
    path('administracion/detalle-nodo', login_required(views.administracion_detalle_nodo, login_url='/administracion/iniciar-sesion'), name='detalle-nodo'),
    path('administracion/conexion-bloque', login_required(views.administracion_conexion_bloque, login_url='/administracion/iniciar-sesion'),name='conexion-bloque'),
    path('administracion/listado-administradores', login_required(views.listado_admins, login_url='/administracion/iniciar-sesion'), name='listar-admins'),
    path('administracion/crear-administrador', login_required(views.crear_admin, login_url='/administracion/iniciar-sesion'), name='crear-admin')
]
