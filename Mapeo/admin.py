from django.contrib import admin

from Mapeo.models import Facultad, Bloque, Ruta


class BloqueAmdin(admin.ModelAdmin):
    list_display = ('id', 'numero', 'zona', 'codigo', 'latitud', 'altitud', 'is_auxiliar', 'facultad')


class FacultadAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre')


class RutaAdmin(admin.ModelAdmin):
    list_display = ('id', '__str__', 'bloque_inicio', 'bloque_destino', 'distancia', 'tiempo')


admin.site.register(Facultad, FacultadAdmin)
admin.site.register(Bloque, BloqueAmdin)
admin.site.register(Ruta, RutaAdmin)
