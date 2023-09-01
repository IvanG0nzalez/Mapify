import math

from django.contrib.auth.models import AbstractBaseUser
from django.core.exceptions import ValidationError
from django.db import models


class Facultad(models.Model):
    nombre = models.CharField(max_length=50, verbose_name='Nombre')
    descripcion = models.TextField(max_length=300, null=True, blank=True, verbose_name='Descripción')
    imagen = models.ImageField(upload_to="facultades", null=True, blank=True, verbose_name='Imagen de la Facultad')

    def __str__(self):
        return self.nombre

    @classmethod
    def obtener_facultades(cls):
        return cls.objects.all()

    @classmethod
    def obtener_facultades_por_nombre(cls, nombre=None):
        if nombre is None:
            return cls.obtener_facultades()
        else:
            return Facultad.objects.filter(nombre__icontains=nombre)

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
    numero = models.PositiveIntegerField(null=True, blank=True, verbose_name='Numero')
    zona = models.CharField(max_length=10, choices=ZONAS, verbose_name='Zona')
    codigo = models.CharField(null=True, blank=True, editable=False, max_length=15, verbose_name='Codigo')
    descripcion = models.CharField(null=True, blank=True, max_length=100, verbose_name='Descripcion')
    latitud = models.FloatField(verbose_name='Latitud')
    altitud = models.FloatField(verbose_name='Altitud')
    is_auxiliar = models.BooleanField(default=False, verbose_name='Auxiliar')
    numero_auxiliar = models.PositiveIntegerField(null=True, blank=True, editable=False, unique=True, verbose_name='Numero Auxiliar')
    facultad = models.ForeignKey('Facultad', on_delete=models.CASCADE, default=None, related_name='bloques')

    def __str__(self):
        return self.codigo

    @classmethod
    def obtener_bloques(cls):
        return cls.objects.select_related('nodo', 'facultad').all()

    @classmethod
    def obtener_bloques_por_descripcion(cls, descripcion=None):
        if descripcion is None:
            return cls.obtener_bloques()
        else:
            return cls.objects.filter(descripcion__icontains=descripcion)

    @classmethod
    def obtener_bloques_por_codigo(cls, codigo=None):
        if codigo is None:
            return cls.obtener_bloques()
        else:
            return cls.objects.filter(codigo__icontains=codigo)

    @classmethod
    def obtener_bloques_por_facultad(cls, facultad):
        return cls.objects.filter(facultad__nombre__contains=facultad)

    def save(self, *args, **kwargs):
        # Verifica si existe un nodo con el mismo código del bloque que fue modificado y lo actualiza
        try:
            nodo = Nodo.objects.get(codigo=self.codigo)
            nodo.latitud = self.latitud
            nodo.altitud = self.altitud
            nodo.codigo = self.codigo
            nodo.save()
        except Nodo.DoesNotExist:
            pass
        # Busca la llave primaria del bloque, si existe significa que el bloque no es nuevo, sino significa que el bloque acaba de ser creado
        es_nuevo = self.pk is None
        # Se verifica si el atributo is_auxiliar es True
        if self.is_auxiliar:
            # El atributo número es seteado en None
            self.numero = None
            # Se valida si el bloque es nuevo, y si lo es, se llama al método get_next_numero_auxiliar para asignarle un número auxiliar al Bloque
            if es_nuevo:
                self.numero_auxiliar = self.get_next_numero_auxiliar()
            # Se le asigna un código al bloque concatenando la letra N junto con el número almacenado en el atributo numero_auxiliar
            self.codigo = f"N{self.numero_auxiliar}"
        # Significa que el atributo is_auxiliar es False
        else:
            # Si existe un numero auxiliar será seteado en None
            if self.numero_auxiliar:
                self.numero_auxiliar = None
            # Se obtiene el primer digito del atributo zona
            primer_digito_zona = self.zona[0]
            # Se genera el código del bloque concatenando el primer digito obtenido de la zona junto con el numero del bloque
            self.codigo = f"{primer_digito_zona}{self.numero}"
        super().save(*args, **kwargs)
        # se comprueba si el bloque es nuevo
        if es_nuevo:
            # Se crea un Nodo con los mismos datos que el Bloque
            Nodo.objects.create(
                bloque=self,
                codigo=self.codigo,
                latitud=self.latitud,
                altitud=self.altitud,
            )

        # Verifica que el bloque no sea nuevo, lo que significa que fue actualizado, y por consecuente el Nodo también
        if not es_nuevo:
            # Se selecciona todos las rutas que tengan al nodo antes modificado como nodo de inicio o destino
            rutas_a_actualizar = Ruta.objects.select_related('nodo_inicio', 'nodo_destino').filter(models.Q(nodo_inicio=self.nodo) | models.Q(nodo_destino=self.nodo))
            # Se recorre cada ruta y se ejecuta el método save para recalcular las distancias y tiempo
            for ruta in rutas_a_actualizar:
                ruta.save()

    # Método para obtener el siguiente número auxiliar disponible
    def get_next_numero_auxiliar(self):
        # Filtra los bloques para obtener únicamente aquellos que son auxiliares, los ordena de forma descendente y selecciona el primero, es decir, el último bloque auxiliar
        last_bloque = Bloque.objects.filter(is_auxiliar=True).exclude(numero_auxiliar=None).order_by('-numero_auxiliar').first()
        # Verifica si existen resultados en la búsqueda realizada
        if last_bloque:
            # Obtiene el número auxiliar del bloque recuperado, lo incrementa en 1 y lo retorna
            return last_bloque.numero_auxiliar + 1
        else:
            # Retorna 1 como numero auxiliar
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

    @classmethod
    def obtener_rutas(cls):
        return cls.objects.select_related('nodo_inicio', '')

    @classmethod
    def obtener_ruta_por_codigo_inicio(cls, nodo_inicio=None):
        if nodo_inicio is None:
            return cls.obtener_rutas()
        else:
            return cls.objects.filter(nodo_inicio__bloque__codigo__icontains=nodo_inicio)

    @classmethod
    def obtener_ruta_por_desc_inicio(cls, nodo_inicio=None):
        if nodo_inicio is None:
            return cls.obtener_rutas()
        else:
            return cls.objects.filter(nodo_inicio__bloque__descripcion__icontains=nodo_inicio)

    @classmethod
    def obtener_ruta_por_codigo_destino(cls, nodo_destino=None):
        if nodo_destino is None:
            return cls.obtener_rutas()
        else:
            return cls.objects.filter(nodo_destino__bloque__codigo__icontains=nodo_destino)

    @classmethod
    def obtener_ruta_por_desc_destino(cls, nodo_destino=None):
        if nodo_destino is None:
            return cls.obtener_rutas()
        else:
            return cls.objects.filter(nodo_inicio__bloque__descripcion__icontains=nodo_destino)

    def calcular_distancia(self, punto1, punto2):
        R = 6371.0

        latitud1, altitud1 = punto1
        latitud2, altitud2 = punto2

        lat1_rad = math.radians(latitud1)
        lat2_rad = math.radians(latitud2)
        delta_lat = lat2_rad - lat1_rad
        deltan_alt = math.radians(altitud2 - altitud1)

        a = math.sin(delta_lat / 2) ** 2 + math.cos(lat1_rad) * math.cos(lat2_rad) * math.sin(deltan_alt / 2) ** 2
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
        d = R * c

        distancia = d * 1000
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

        Ruta.objects.get_or_create(nodo_inicio=self.nodo_destino, nodo_destino=self.nodo_inicio)

    def delete(self, *args, **kwargs):
        super().delete(*args, **kwargs)
        try:
            ruta_inversa = Ruta.objects.get(nodo_inicio=self.nodo_destino, nodo_destino=self.nodo_inicio)
            ruta_inversa.delete()
        except Ruta.DoesNotExist:
            pass

    class Meta:
        verbose_name = 'Ruta'
        verbose_name_plural = 'Rutas'
        db_table = 'rutas'
        ordering = ['distancia', '-distancia']


class Nodo(models.Model):
    bloque = models.OneToOneField('Bloque', on_delete=models.CASCADE, primary_key=False, related_name='nodo')
    codigo = models.CharField(null=True, blank=True, editable=False, max_length=15, verbose_name='Codigo')
    latitud = models.FloatField(null=True, blank=True, editable=False, verbose_name='Latitud')
    altitud = models.FloatField(null=True, blank=True, editable=False, verbose_name='Altitud')

    def __str__(self):
        return self.codigo

    @classmethod
    def obtener_nodos(cls):
        return cls.objects.all()

    @classmethod
    def obtener_nodo_por_codigo(cls, codigo=None):
        if codigo is None:
            return cls.obtener_nodos()
        else:
            return cls.objects.filter(codigo__contains=codigo)

    @classmethod
    def obtener_nodo_por_descripcion_bloque(cls, bloque):
        return cls.objects.filter(bloque__descripcion__icontains=bloque)

    @classmethod
    def obtener_nodo_por_codigo_bloque(cls, bloque):
        return cls.objects.filter(bloque__codigo__contains=bloque)

    @classmethod
    def obtener_nodos_no_auxiliares(cls):
        return cls.objects.exclude(codigo__contains='N')

    class Meta:
        verbose_name = 'Nodo'
        verbose_name_plural = 'Nodos'
        db_table = 'nodos'
        ordering = ['codigo', '-codigo']
