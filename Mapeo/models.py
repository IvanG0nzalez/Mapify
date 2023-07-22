import math

from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.core.exceptions import ValidationError
from django.db import models
from pymongo import MongoClient

cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
client = MongoClient(cadenaConexion)
db = client['ProyectoIntegrador']


class UsuarioManager(BaseUserManager):
    def create_user(self, username, email, nombres, apellidos, cedula, password=None):
        if not email:
            raise ValueError('El usuario debe poseer un correo electrónico')

        usuario = self.model(
            username=username,
            email=self.normalize_email(email),
            nombres=nombres,
            apellidos=apellidos,
            cedula=cedula
        )

        usuario.set_password(password)
        usuario.save()
        return usuario

    def create_superuser(self, username, email, nombres, apellidos, cedula, password):
        usuario = self.create_user(
            username=username,
            email=email,
            nombres=nombres,
            apellidos=apellidos,
            cedula=cedula,
            password=password
        )
        usuario.is_superuser = True
        usuario.is_administrador = True
        usuario.save()
        return usuario


class Usuario(AbstractBaseUser):
    username = models.CharField('Nombre de usuario', unique=True, max_length=50)
    email = models.EmailField('Correo Electrónico', unique=True, max_length=200)
    nombres = models.CharField('Nombres', null=True, blank=True, max_length=200)
    apellidos = models.CharField('Apellidos', blank=True, null=True, max_length=200)
    cedula = models.CharField('Cédula', unique=True, max_length=10)
    is_activo = models.BooleanField(default=True)
    is_administrador = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    objects = UsuarioManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email', 'nombres', 'apellidos', 'cedula']

    def __str__(self):
        return f"{self.username}: {self.nombres} {self.apellidos}"

    def has_perm(self, perm,obj = None):
        return True

    def has_module_perms(self,app_label):
        return True

    @property
    def is_staff(self):
        return self.is_administrador


class Facultad(models.Model):
    nombre = models.CharField(max_length=50, verbose_name='Nombre')

    def __str__(self):
        return self.nombre

    def obtener_facultades(self):
        return Facultad.objects.all()

    def obtener_facultades_por_nombre(self, nombre=None):
        if nombre is None:
            return self.obtener_facultades()
        else:
            return Facultad.objects.filter(nombre__icontains=nombre)

    def delete(self, *args, **kwargs):
        bloques = self.bloques.all()
        for bloque in bloques:
            db.get_collection('nodos').delete_one({'_id': bloque.id})
        super().delete(*args, **kwargs)

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
    descripcion = models.CharField(null=True, blank=True, max_length=50, verbose_name='Descripcion')
    latitud = models.FloatField(verbose_name='Latitud')
    altitud = models.FloatField(verbose_name='Altitud')
    is_auxiliar = models.BooleanField(default=False, verbose_name='Auxiliar')
    numero_auxiliar = models.PositiveIntegerField(null=True, blank=True, editable=False, unique=True, verbose_name='Numero Auxiliar')
    facultad = models.ForeignKey('Facultad', on_delete=models.CASCADE, default=None, related_name='bloques')

    def __str__(self):
        return self.codigo

    def obtener_bloques(self):
        return Bloque.objects.all()

    def obtener_bloques_por_descripcion(self, descripcion=None):
        if descripcion is None:
            return self.obtener_bloques()
        else:
            return Bloque.objects.filter(descripcion__icontains=descripcion)

    def obtener_bloques_por_codigo(self, codigo=None):
        if codigo is None:
            return self.obtener_bloques()
        else:
            return Bloque.objects.filter(codigo__icontains=codigo)

    def obtener_bloques_por_facultad(self, facultad):
        return Bloque.objects.filter(facultad__nombre__contains=facultad)

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

    def __str__(self):
        return f"[{self.nodo_inicio} - {self.nodo_destino}]"

    def obtener_rutas(self):
        return Ruta.objects.all()

    def obtener_ruta_por_codigo_inicio(self, nodo_inicio=None):
        if nodo_inicio is None:
            return self.obtener_rutas()
        else:
            return Ruta.objects.filter(nodo_inicio__bloque__codigo__icontains=nodo_inicio)

    def obtener_ruta_por_desc_inicio(self, nodo_inicio=None):
        if nodo_inicio is None:
            return self.obtener_rutas()
        else:
            return Ruta.objects.filter(nodo_inicio__bloque__descripcion__icontains=nodo_inicio)

    def obtener_ruta_por_codigo_destino(self, nodo_destino=None):
        if nodo_destino is None:
            return self.obtener_rutas()
        else:
            return Ruta.objects.filter(nodo_destino__bloque__codigo__icontains=nodo_destino)

    def obtener_ruta_por_desc_destino(self, nodo_destino=None):
        if nodo_destino is None:
            return self.obtener_rutas()
        else:
            return Ruta.objects.filter(nodo_inicio__bloque__descripcion__icontains=nodo_destino)

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

    def __str__(self):
        return self.codigo

    def obtener_nodos(self):
        return Nodo.objects.all()

    def obtener_nodo_por_codigo(self, codigo=None):
        if codigo is None:
            return self.obtener_nodos()
        else:
            return Nodo.objects.filter(codigo__contains=codigo)

    def obtener_nodo_por_descripcion_bloque(self, bloque):
        return Nodo.objects.filter(bloque__descripcion__icontains=bloque)

    def obtener_nodo_por_codigo_bloque(self, bloque):
        return Nodo.objects.filter(bloque__codigo__contains=bloque)

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

    class Meta:
        verbose_name = 'Nodo'
        verbose_name_plural = 'Nodos'
        db_table = 'nodos'
        ordering = ['codigo', '-codigo']
