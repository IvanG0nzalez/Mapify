from django.contrib.auth.decorators import login_required
from django.urls import path, include
from Mapeo import views
from Mapeo.views import ListadoUsuario, CrearUsuario

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('busqueda', views.busqueda_rutas_user, name='busqueda_user'),
    path('administracion/iniciar-sesion', views.iniciar_sesion, name='login'),
    path('administracion/inicio', login_required(views.administracion_inicio, login_url='/administracion/iniciar-sesion'), name='administracion-inicio'),
    path('administracion/bloque', login_required(views.administracion_bloque, login_url='/administracion/iniciar-sesion'), name='bloque'),
    path('administracion/detalle-bloque', login_required(views.administracion_detalle_bloque, login_url='/administracion/iniciar-sesion'), name='detalle-bloque'),
    path('administracion/anadir-bloque', login_required(views.administracion_anadir_bloque, login_url='/administracion/iniciar-sesion'), name='anadir-bloque'),
    path('administracion/modificar-bloque', login_required(views.administracion_modificar_bloque, login_url='/administracion/iniciar-sesion'), name='modificar-bloque'),
    path('administracion/cerrar-sesion', views.cerrar_sesion, name='cerrar_sesion'),
    path('administracion/grafo', login_required(views.grafo_admin, login_url='/administracion/iniciar-sesion'), name='grafo'),
    path('administracion/listado-administradores', login_required(ListadoUsuario.as_view(), login_url='/administracion/iniciar-sesion'), name='listar_admins'),
    path('administracion/crear-administrador', login_required(CrearUsuario.as_view(), login_url='/administracion/iniciar-sesion'), name='crear_admin'),
]
