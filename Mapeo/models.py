import math

from django.core.exceptions import ValidationError
from django.db import models
from django.db.models.signals import post_delete
from django.dispatch import receiver
from pymongo import MongoClient

cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
client = MongoClient(cadenaConexion)
db = client['ProyectoIntegrador']


class Facultad(models.Model):
    nombre = models.CharField(max_length=50, verbose_name='Nombre')

    def delete(self, *args, **kwargs):
        bloques = self.bloques.all()
        for bloque in bloques:
            db.get_collection('nodos').delete_one({'_id': bloque.id})
        super().delete(*args, **kwargs)

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = 'Facultad'
        verbose_name_plural = 'Facultades'
        db_table = 'facultades'
        ordering = ['nombre']


class Bloque(models.Model):
    ZONAS = [
        ("A", "Argelia"),
        ("S", "Sauces"),
        ("M", "Motupe"),
        ("P", "Punzara"),
    ]
    numero = models.PositiveIntegerField(null=True, blank=True, unique=True, verbose_name='Numero')
    zona = models.CharField(max_length=10, choices=ZONAS, verbose_name='Zona')
    codigo = models.CharField(null=True, blank=True, editable=False, max_length=15, verbose_name='Codigo')
    latitud = models.FloatField(verbose_name='Latitud')
    altitud = models.FloatField(verbose_name='Altitud')
    is_auxiliar = models.BooleanField(default=False, verbose_name='Auxiliar')
    numero_auxiliar = models.PositiveIntegerField(null=True, blank=True, editable=False, unique=True, verbose_name='Numero Auxiliar')
    facultad = models.ForeignKey('Facultad', on_delete=models.CASCADE, default=None, related_name='bloques')

    def save(self, *args, **kwargs):
        if self.is_auxiliar:
            self.numero = None
            self.numero_auxiliar = self.get_next_numero_auxiliar()
            self.codigo = f"N{self.numero_auxiliar}"
        else:
            if self.numero_auxiliar:
                self.numero_auxiliar = None
            primer_digito_zona = self.zona[0]
            self.codigo = f"{primer_digito_zona}{self.numero}"

        es_nuevo = self.pk is None
        super().save(*args, **kwargs)

        if es_nuevo:
            Nodo.objects.create(
                bloque=self,
                codigo=self.codigo,
                latitud=self.latitud,
                altitud=self.altitud,
            )
        else:
            try:
                nodo = Nodo.objects.get(codigo=self.codigo)
                nodo.latitud = self.latitud
                nodo.altitud = self.altitud
                nodo.codigo = self.codigo
                nodo.save()
            except Nodo.DoesNotExist:
                pass

    def delete(self, *args, **kwargs):
        nodo = self.nodo
        db.get_collection('nodos').delete_one({'_id': nodo.id})
        super().delete(*args, **kwargs)

    def get_next_numero_auxiliar(self):
        last_bloque = Bloque.objects.filter(is_auxiliar=True).exclude(numero_auxiliar=None).order_by('-numero_auxiliar').first()
        if last_bloque:
            return last_bloque.numero_auxiliar + 1
        else:
            return 1

    def __str__(self):
        return self.codigo

    class Meta:
        verbose_name = 'Bloque'
        verbose_name_plural = 'Bloques'
        db_table = 'bloques'
        ordering = ['numero', '-numero']


class Ruta(models.Model):
    nodo_inicio = models.ForeignKey('Nodo', on_delete=models.CASCADE, related_name='Rutas_Inicio')
    nodo_destino = models.ForeignKey('Nodo', on_delete=models.CASCADE, related_name='Rutas_Destino')
    distancia = models.FloatField(null=True, blank=True, editable=False, verbose_name='Distancia')
    tiempo = models.FloatField(null=True, blank=True, editable=False, verbose_name='Tiempo en segundos')

    def calcular_distancia(self, punto1, punto2):
        R = 6371.0

        latitud1, altitud1 = punto1
        latitud2, altitud2 = punto2

        lat1_rad = math.radians(latitud1)
        lat2_rad = math.radians(latitud2)
        delta_lat = lat2_rad - lat1_rad

        a = math.sin(delta_lat / 2) ** 2 + math.cos(lat1_rad) * math.cos(lat2_rad) * math.sin(0) ** 2
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
        d = R * c

        distancia = math.sqrt(d ** 2 + (altitud2 - altitud1) ** 2)
        distancia *= 1000
        return round(distancia, 2)

    def calcular_tiempo(self, distancia):
        velocidad = 1.11111
        tiempo = distancia/velocidad
        return round(tiempo, 2)

    def clean(self):
        if self.nodo_inicio.id == self.nodo_destino.id:
            raise ValidationError("No se puede seleccionar el bloque de inicio como destino")

    def save(self, *args, **kwargs):
        punto_inicio = (self.nodo_inicio.latitud, self.nodo_inicio.altitud)
        punto_destino = (self.nodo_destino.latitud, self.nodo_destino.altitud)
        distancia = self.calcular_distancia(punto_inicio, punto_destino)
        self.distancia = distancia
        self.tiempo = self.calcular_tiempo(distancia)
        super().save(*args, **kwargs)

        documento_existente = db.nodos.find_one({'_id': self.nodo_inicio.id})
        if documento_existente:
            documento_existente['conexiones'].append(self.nodo_destino.codigo)
            db.nodos.update_one(
                {'_id': self.nodo_inicio.id},
                {'$set': {'conexiones': documento_existente['conexiones']}}
            )

    def delete(self, *args, **kwargs):
        documento_existente = db.nodos.find_one({'_id': self.nodo_inicio.id})
        if documento_existente:
            documento_existente['conexiones'].remove(self.nodo_destino.codigo)
            db.nodos.update_one(
                {'_id': self.nodo_inicio.id},
                {'$set': {'conexiones': documento_existente['conexiones']}}
            )
        super().delete(*args, **kwargs)

    def __str__(self):
        return f"[{self.nodo_inicio} - {self.nodo_destino}]"

    class Meta:
        verbose_name = 'Ruta'
        verbose_name_plural = 'Rutas'
        db_table = 'rutas'
        ordering = ['distancia', '-distancia']

"""
EL POST DELETE PUEDE USARSE PARA MANEJAR LA SEÑAL DE ELIMINACIÓN INCLUSO SI SE USA OTROS 
MÉTODOS DE ELIMINADO, COMO EL DE LA INTERFAZ DE ADMIN DE DJANGO

@receiver(post_delete, sender=Ruta)
def eliminar_conexion_nodo_destino(sender, instance, **kwargs):
    if instance.nodo_inicio:
        documento_existente = db.nodos.find_one({'_id': instance.nodo_inicio.id})
        if documento_existente:
            documento_existente['conexiones'].remove(instance.nodo_destino.codigo)
            db.nodos.update_one(
                {'_id': instance.nodo_inicio.id},
                {'$set': {'conexiones': documento_existente['conexiones']}}
            )
"""

class Nodo(models.Model):
    bloque = models.OneToOneField('Bloque', on_delete=models.CASCADE, primary_key=False, related_name='nodo')
    codigo = models.CharField(null=True, blank=True, editable=False, max_length=15, verbose_name='Codigo')
    latitud = models.FloatField(null=True, blank=True, editable=False, verbose_name='Latitud')
    altitud = models.FloatField(null=True, blank=True, editable=False, verbose_name='Altitud')

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        documento_existente = db.nodos.find_one({'_id': self.id})
        if documento_existente:
            db.nodos.update_one(
                {'_id': self.id},
                {'$set': {'codigo': self.codigo, 'latitud': self.latitud, 'altitud': self.altitud}}
            )
        else:
            db.nodos.insert_one(
                {
                    '_id': self.id,
                    'codigo': self.codigo,
                    'latitud': self.latitud,
                    'altitud': self.altitud,
                    'conexiones': list(),
                }
            )

    def delete(self, *args, **kwargs):
        db.nodos.delete_one(
            {
                '_id': self.id
            }
        )
        super().delete(*args, **kwargs)
    """
    @classmethod
    def get_next_numero_nodo(cls):
        last_nodo = cls.objects.exclude(numero=None).order_by('-numero').first()
        print(last_nodo)
        if last_nodo and last_nodo.numero is not None:
            return last_nodo.numero + 1
        else:
            return 1
    """
    def __str__(self):
        return self.codigo

    class Meta:
        verbose_name = 'Nodo'
        verbose_name_plural = 'Nodos'
        db_table = 'nodos'
        ordering = ['codigo', '-codigo']
