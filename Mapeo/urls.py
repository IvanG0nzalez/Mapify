from django.contrib.auth.decorators import login_required
from django.urls import path
from Mapeo import views
from Mapeo.views import ListadoUsuario, CrearUsuario

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('busqueda', views.busqueda_rutas_user, name='busqueda_user'),
    path('administracion/inicio', views.administracion_inicio, name='administracion-inicio'),
    path('administracion/bloque', views.administracion_bloque, name='bloque'),
    path('administracion/detalle-bloque', views.administracion_detalle_bloque, name='detalle-bloque'),
    path('administracion/anadir-bloque', views.administracion_anadir_bloque, name='anadir-bloque'),
    path('administracion/modificar-bloque', views.administracion_modificar_bloque, name='modificar-bloque'),
    path('administracion/cerrar-sesion', views.cerrar_sesion, name='cerrar_sesion'),
    path('administracion/grafo', views.grafo_admin, name='grafo'),
    path('administracion/listado-administradores', login_required(ListadoUsuario.as_view()), name='listar_admins'),
    path('administracion/crear-administrador', login_required(CrearUsuario.as_view()), name='crear_admin'),
]
