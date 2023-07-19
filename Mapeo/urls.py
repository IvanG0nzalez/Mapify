from django.urls import path
from Mapeo import views

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('pantallaBase', views.pantallaBase, name='pantallaBase'),
]
