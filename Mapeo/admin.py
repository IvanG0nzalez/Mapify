from django.contrib import admin

from Mapeo.models import Facultad, Bloque, Ruta, Nodo


class FacultadAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre')


class BloqueAmdin(admin.ModelAdmin):
    list_display = (
    'id', 'numero', 'zona', 'codigo', 'latitud', 'altitud', 'is_auxiliar', 'numero_auxiliar', 'facultad')


class RutaAdmin(admin.ModelAdmin):
    list_display = ('id', '__str__', 'nodo_inicio', 'nodo_destino', 'distancia', 'tiempo')


class NodoAdmin(admin.ModelAdmin):
    list_display = ('id', 'bloque', 'codigo', 'latitud', 'altitud')


admin.site.register(Facultad, FacultadAdmin)
admin.site.register(Bloque, BloqueAmdin)
admin.site.register(Ruta, RutaAdmin)
admin.site.register(Nodo, NodoAdmin)
