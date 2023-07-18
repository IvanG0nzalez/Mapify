import math

from django.core.exceptions import ValidationError
from django.db import models
from django.db.models.signals import post_save, pre_delete
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
    #conexiones = models.ManyToManyField('self', blank=True, symmetrical=False, related_name='Conexiones')

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
                numero=Nodo.get_next_numero_nodo(),
                codigo=self.codigo,
                latitud=self.latitud,
                altitud=self.altitud,
            )
        else:
            try:
                nodo = Nodo.objects.get(codigo=self.codigo)
                nodo.latitud = self.altitud
                nodo.altitud = self.altitud
                nodo.codigo = self.codigo
                nodo.save()
            except Nodo.DoesNotExist:
                pass
        #nro_conexiones = self.conexiones.values_list('id', flat=True)
        #print(self.conexiones.values_list('id', flat=True))
        documento_existente = db.nodos.find_one({'_id': self.id})
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
                    'conexiones': list(),
                }
            )

    def get_next_numero_auxiliar(self):
        last_bloque = Bloque.objects.filter(is_auxiliar=True).exclude(numero_auxiliar=None).order_by('-numero_auxiliar').first()
        print(last_bloque)
        if last_bloque:
            return last_bloque.numero_auxiliar + 1
        else:
            return 1

    def delete(self, *args, **kwargs):
        db.nodos.delete_one(
            {
                '_id': self.id
            }
        )
        Nodo.objects.filter(codigo=self.codigo).delete()
        super().delete(*args, **kwargs)

    def __str__(self):
        return self.codigo

    class Meta:
        verbose_name = 'Bloque'
        verbose_name_plural = 'Bloques'
        db_table = 'bloques'
        ordering = ['numero', '-numero']


"""
@receiver(post_save, sender=Bloque)
def actualizar_codigo(sender, instance, created, **kwargs):
    if created:
        primer_digito_zona = instance.zona[0]
        instance.codigo = f"{primer_digito_zona}{instance.numero}"
        instance.save()
"""


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
            documento_existente['conexiones'].append(self.nodo_destino.id)
            db.nodos.update_one(
                {'_id': self.nodo_inicio.id},
                {'$set': {'conexiones': documento_existente['conexiones']}}
            )

    def __str__(self):
        return f"[{self.nodo_inicio} - {self.nodo_destino}]"

    class Meta:
        verbose_name = 'Ruta'
        verbose_name_plural = 'Rutas'
        db_table = 'rutas'
        ordering = ['distancia', '-distancia']


class Nodo(models.Model):
    numero = models.PositiveIntegerField(null=False, blank=False, unique=True, editable=False, verbose_name='Numero')
    codigo = models.CharField(null=True, blank=True, editable=False, max_length=15, verbose_name='Codigo')
    latitud = models.FloatField(null=True, blank=True, editable=False, verbose_name='Latitud')
    altitud = models.FloatField(null=True, blank=True, editable=False, verbose_name='Altitud')

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

    """
    def actualizar_numero(self):
        ultimo_numero = Nodo.objects.aggregate(models.Max('numero'))['numero__max']
        if ultimo_numero is not None:
            self.numero = ultimo_numero + 1
        else:
            self.numero = 1
        self.save()
    """
    @classmethod
    def get_next_numero_nodo(cls):
        last_nodo = cls.objects.exclude(numero=None).order_by('-numero').first()
        print(last_nodo)
        if last_nodo and last_nodo.numero is not None:
            return last_nodo.numero + 1
        else:
            return 1

    def __str__(self):
        return self.codigo

    class Meta:
        verbose_name = 'Nodo'
        verbose_name_plural = 'Nodos'
        db_table = 'nodos'
        ordering = ['numero', '-numero']
