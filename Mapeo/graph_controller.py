import heapq
import math
import networkx as nx
from Mapeo.models import Nodo, Ruta


class ControladorGrafo:
    # Inicializa la clase con un grafo vacío y asigna los nodos de la base de datos a la variable data_db
    def __init__(self):
        self.graph = None
        self.data_db = self.obtener_nodos_db()

    def calcular_distancia(self, punto1, punto2):
        R = 6371.0

        latitud1, altitud1 = punto1
        latitud2, altitud2 = punto2

        lat1_rad = math.radians(latitud1)
        lat2_rad = math.radians(latitud2)
        delta_lat = lat2_rad - lat1_rad
        deltan_alt = math.radians(altitud2 - altitud1)

        a = math.sin(delta_lat / 2) ** 2 + math.cos(lat1_rad) * math.cos(lat2_rad) * math.sin(deltan_alt/ 2) ** 2
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
        d = R * c

        distancia = d * 1000
        return round(distancia, 2)

    def calcular_tiempo(self, distancia):
        velocidad = 1.11111
        tiempo = distancia / velocidad
        return round(tiempo, 2)

    # Accede a la base de datos y obtiene todos los registros de nodos existentes
    def obtener_nodos_db(self):
        nodos_db = Nodo.objects.all()

        data = [
            {
                'codigo': nodo.codigo,
                'latitud': nodo.latitud,
                'altitud': nodo.altitud,
            }
            for nodo in nodos_db
        ]

        return data

    def crear_grafo(self):
        # Inicializa un grafo vacío
        self.graph = nx.Graph()
        # Recorre la vairbale data_db y asigna los registros a un nuevo nodo del grafo
        for nodo in self.data_db:
            codigo = nodo['codigo']
            latitud = nodo['latitud']
            altitud = nodo['altitud']
            self.graph.add_node(codigo, latitud=latitud, altitud=altitud)
        # Recorre las rutas almacenadas en la base de datos y crea las aristas con las distancias y tiempos almacenados
        for ruta in Ruta.objects.select_related('nodo_destino', 'nodo_inicio').all():
            codigo_origen = ruta.nodo_inicio.codigo
            codigo_destino = ruta.nodo_destino.codigo
            distancia = ruta.distancia
            tiempo = ruta.tiempo
            # Verifica si existe una arista ya creada entre los nodos evaluados, si ya existe la omite
            if not self.graph.has_edge(codigo_origen, codigo_destino):
                self.graph.add_edge(codigo_origen, codigo_destino, distancia=distancia, tiempo=tiempo)
            else:
                print(f"Graph Controller: Se evitó la creación de una arista duplicada: {codigo_origen} -> {codigo_destino}")

    # Obtiene nuevamente todos los nodos de la base de datos y llama a la función para crear el grafo
    def obtener_grafo(self):
        self.data_db = self.obtener_nodos_db()
        self.crear_grafo()
        return self.graph

    def minimo_dijkstra(self, origen):
        # Si el origen enviado no se encuentra en el grafo se lanza una excepción
        if origen not in self.graph.nodes():
            raise NodoNoExisteException(f"El nodo {origen} no existe en el grafo.")
        # Diccionario que contiene todas las distancias incializadas en infinito
        distancias = {nodo: float('inf') for nodo in self.graph.nodes()}
        # Se establece la distancia desde el origen hacia sí mismo en 0
        distancias[origen] = 0
        # Diccionario con todos los nodos, donde se inicializa en infinito, para cada nodo, la distancia y el tiempo, y la ruta como una lista vacía
        rutas = {nodo: {'distancia': float('inf'), 'ruta': [], 'tiempo': float('inf')} for nodo in self.graph.nodes()}
        # Se establece la distancia y tiempo del origen hacia si mismo en 0 y la ruta se compondrá únicamente de sí mismo
        rutas[origen] = {'distancia': 0, 'ruta': [origen], 'tiempo': 0}
        # Cola de prioridad con un tupla que contiene la distancia actual (inicialmente en 0) y el origen
        cola = [(0, origen)]

        while cola:
            # se extrae el elemento de la cola con la distancia actual y el nodo actual
            distancia_actual, nodo_actual = heapq.heappop(cola)
            # Verifica si la distancia actual es mayor que la distancia almacenada en el diccionario distancias para el nodo actual,
            # de serlo, se ignora la iteración y continua a la siguiente
            if distancia_actual > distancias[nodo_actual]:
                continue
            # Para cada nodo vecino del nodo actual
            for vecino in self.graph[nodo_actual]:
                # Se calcula la nueva distancia sumando la distancia desde el nodo actual al vecino y la distancia ya calculada
                distancia = distancia_actual + self.graph[nodo_actual][vecino]['distancia']
                # Se calcula el nuevo tiempo sumando el tiempo ya calculado para el nodo actual al tiempo desde el nodo actual al vecino
                tiempo = rutas[nodo_actual]['tiempo'] + self.graph[nodo_actual][vecino]['tiempo']
                # Se verifica si la distancia calculada es menor a la distancia almacenada en el diccionario
                if distancia < distancias[vecino]:
                    # Se actualiza la distancia en el dic 'distancias'
                    distancias[vecino] = distancia
                    # Se actualiza la distancia, ruta y tiempo en el dic 'rutas'
                    rutas[vecino]['distancia'] = distancia
                    rutas[vecino]['ruta'] = rutas[nodo_actual]['ruta'] + [vecino]
                    rutas[vecino]['tiempo'] = tiempo
                    # Se agrega una tupla a la cola con la nueva distancia y el nodo vecino
                    heapq.heappush(cola, (distancia, vecino))
        return rutas

    def obtener_coordenadas_por_codigo(self, codigo):
        if not self.data_db:
            self.data_db = self.obtener_nodos_db()

        for nodo in self.data_db:
            codigo_nodo_db = nodo['codigo']
            if codigo_nodo_db == codigo:
                latitud = nodo['latitud']
                altitud = nodo['altitud']
                return latitud, altitud
        return None


class NodoNoExisteException(Exception):
    def __init__(self, mensaje):
        super().__init__(mensaje)
