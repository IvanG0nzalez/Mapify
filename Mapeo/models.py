import math

from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from pymongo import MongoClient

cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
client = MongoClient(cadenaConexion)
db = client['ProyectoIntegrador']


class Facultad(models.Model):
    nombre = models.CharField(max_length=50, verbose_name='Nombre')

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
    numero = models.PositiveIntegerField(null=False, blank=False, unique=True, verbose_name='Numero')
    zona = models.CharField(max_length=10, choices=ZONAS, verbose_name='Zona')
    codigo = models.CharField(null=True, blank=True, editable=False, max_length=15, verbose_name='Codigo')
    latitud = models.FloatField(verbose_name='Latitud')
    altitud = models.FloatField(verbose_name='Altitud')
    is_auxiliar = models.BooleanField(default=False, verbose_name='Auxiliar')
    facultad = models.ForeignKey('Facultad', on_delete=models.CASCADE, related_name='Bloques')

    def save(self, *args, **kwargs):
        primer_digito_zona = self.zona[0]
        self.codigo = f"{primer_digito_zona}{self.numero}"
        super().save(*args, **kwargs)

        documento_existente = db.nodos.find_one({'_id': self.numero})
        if documento_existente:
            db.nodos.update_one(
                {'_id': self.id},
                {'$set': {'numero': self.numero, 'latitud': self.latitud, 'altitud': self.altitud}}
            )
        else:
            db.nodos.insert_one(
                {
                    '_id': self.id,
                    'numero': self.numero,
                    'latitud': self.latitud,
                    'altitud': self.altitud,
                }
            )

    def delete(self, *args, **kwargs):
        db.nodos.delete_one(
            {
                '_id': self.id
            }
        )
        super().delete(*args, **kwargs)

    def __str__(self):
        return self.codigo

    class Meta:
        verbose_name = 'Bloque'
        verbose_name_plural = 'Bloques'
        db_table = 'bloques'
        ordering = ['numero', '-numero']


@receiver(post_save, sender=Bloque)
def actualizar_codigo(sender, instance, created, **kwargs):
    if created:
        primer_digito_zona = instance.zona[0]
        instance.codigo = f"{primer_digito_zona}{instance.numero}"
        instance.save()


class Ruta(models.Model):
    bloque_inicio = models.ForeignKey('Bloque', on_delete=models.CASCADE, related_name='Rutas_Inicio')
    bloque_destino = models.ForeignKey('Bloque', on_delete=models.CASCADE, related_name='Rutas_Destino')
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

    def save(self, *args, **kwargs):
        punto_inicio = (self.bloque_inicio.latitud, self.bloque_inicio.altitud)
        punto_destino = (self.bloque_destino.latitud, self.bloque_destino.altitud)
        distancia = self.calcular_distancia(punto_inicio, punto_destino)
        self.distancia = distancia
        self.tiempo = self.calcular_tiempo(distancia)
        super().save(*args, **kwargs)

    def __str__(self):
        return f"[{self.bloque_inicio} - {self.bloque_destino}]"

    class Meta:
        verbose_name = 'Ruta'
        verbose_name_plural = 'Rutas'
        db_table = 'rutas'
        ordering = ['distancia', '-distancia']
