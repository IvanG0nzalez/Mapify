from django.urls import path
from Mapeo import views

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('busqueda', views.busqueda_rutas_user, name='busqueda_user'),
    path('administracion/inicio', views.administracion_inicio, name='administracion-inicio'),
    path('administracion/cerrar-sesion', views.cerrar_sesion, name='cerrar_sesion'),
    path('administracion/grafo', views.grafo_admin, name='grafo'),
]
