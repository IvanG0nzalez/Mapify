from django.contrib import admin

from Mapeo.models import Facultad, Bloque, Ruta, Nodo


class BloqueAmdin(admin.ModelAdmin):
    list_display = ('id', 'numero', 'zona', 'codigo', 'latitud', 'altitud', 'is_auxiliar', 'facultad')


class FacultadAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre')


class RutaAdmin(admin.ModelAdmin):
    list_display = ('id', '__str__', 'bloque_inicio', 'bloque_destino', 'distancia', 'tiempo')


class NodoAdmin(admin.ModelAdmin):
    list_display = ('id', 'numero', 'codigo', 'latitud', 'altitud')


admin.site.register(Facultad, FacultadAdmin)
admin.site.register(Bloque, BloqueAmdin)
admin.site.register(Ruta, RutaAdmin)
admin.site.register(Nodo, NodoAdmin)
