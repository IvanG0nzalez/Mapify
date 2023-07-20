from django.urls import path
from Mapeo import views

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('pantallaBase', views.pantallaBase, name='pantallaBase'),
    path('administracion/inicio', views.administracion_inicio, name='administracion-inicio'),
    path('administracion/cerrar-sesion', views.cerrar_sesion, name='cerrar_sesion'),
]
