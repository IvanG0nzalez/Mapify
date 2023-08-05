import heapq
import math
import time

import networkx as nx
from pymongo import MongoClient

from Mapeo.models import Nodo


class ControladorGrafo:
    def __init__(self):
        self.graph = None
        self.data_db = self.obtener_nodos_db()
        self.ultima_actualizacion = 0
        self.num_nodos = 0

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
        tiempo = distancia / velocidad
        return round(tiempo, 2)

    # Accede a la base de datos y obtiene todos los registros de nodos existentes
    def obtener_nodos_db(self):
        cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
        client = MongoClient(cadenaConexion)
        db = client['ProyectoIntegrador']
        coleccion = db['nodos']

        data = list(coleccion.find())

        client.close()
        return data

    def crear_grafo(self):
        # Inicializa un grafo vacío
        self.graph = nx.Graph()
        distancias = {}
        # Recorre la vairbale data_db y asigna los registros a un nuevo nodo del grafo
        for nodo in self.data_db:
            codigo = nodo['codigo']
            latitud = nodo['latitud']
            altitud = nodo['altitud']
            self.graph.add_node(codigo, latitud=latitud, altitud=altitud)
        # Recorre la variable data_db y obtiene la lista de conexiones de cada nodo
        for nodo in self.data_db:
            codigo_origen = nodo['codigo']
            conexiones = nodo['conexiones']
            latitud_origen = nodo['latitud']
            altitud_origen = nodo['altitud']
            # Para cada conexión crea una arista con la distancia y tiempo calculados
            for codigo_destino in conexiones:
                if not self.graph.has_edge(codigo_origen, codigo_destino) and not self.graph.has_edge(codigo_destino, codigo_origen):
                    if codigo_destino in distancias:
                        distancia, tiempo = distancias[codigo_destino]
                    else:
                        nodo_destino = next((n for n in self.data_db if n['codigo'] == codigo_destino), None)
                        if nodo_destino:
                            latitud_destino = nodo_destino['latitud']
                            altitud_destino = nodo_destino['altitud']

                            distancia = self.calcular_distancia((latitud_origen, altitud_origen),
                                                                (latitud_destino, altitud_destino))

                            tiempo = self.calcular_tiempo(distancia)

                            distancias[codigo_destino] = (distancia, tiempo)
                        else:
                            print(
                                f"Graph Controller: La conexión {codigo_origen} -> {codigo_destino} no pudo establecerse: Nodo de destino inexistente.")
                            continue
                    self.graph.add_edge(codigo_origen, codigo_destino, distancia=distancia, tiempo=tiempo)
                else:
                    print(f"Graph Controller: Se evitó la creación de una arista duplicada {codigo_origen} -> {codigo_destino}")
        # ControladorGrafo.grafo_creado = True
        # ControladorGrafo.ultima_actualizacion = time.time()
        # ControladorGrafo.num_nodos = len(self.graph.nodes)
        # print(f"num_ndoos_controlador: {ControladorGrafo.num_nodos}")

    def grafo_existe_actualizado(self):
        tiempo_actual = time.time()
        cantidad_nodos = len(self.data_db)
        if self.graph and (tiempo_actual - self.ultima_actualizacion) <= 600 and len(self.graph.nodes) == cantidad_nodos:
            print(f"Tiempo en segundos desde la ultima actu del grafo: {tiempo_actual - self.ultima_actualizacion}")
            print(f"Grafo existe: {self.graph}")
            print(f"Cantidad de nodos del grafo: {len(self.graph.nodes)}")
            print(f"Cantidad de nodos en la DB: {cantidad_nodos}")
            return True
        print(f"Tiempo en segs sobrepasó los 600: {tiempo_actual - self.ultima_actualizacion}")
        print(f"Grafo puede que no existe: {self.graph}")
        return False

    def obtener_grafo(self):
        # self.actualizar_grafo()
        if not self.grafo_existe_actualizado():
            self.data_db = self.obtener_nodos_db()
            self.crear_grafo()
            self.ultima_actualizacion = time.time()
            self.num_nodos = len(self.graph.nodes)
        return self.graph

    def minimo_dijkstra(self, origen):
        if origen not in self.graph.nodes():
            raise NodoNoExisteException(f"El nodo {origen} no existe en el grafo.")

        distancias = {nodo: float('inf') for nodo in self.graph.nodes()}
        distancias[origen] = 0
        rutas = {nodo: {'distancia': float('inf'), 'ruta': [], 'tiempo': float('inf')} for nodo in self.graph.nodes()}
        rutas[origen] = {'distancia': 0, 'ruta': [origen], 'tiempo': 0}
        cola = [(0, origen)]

        while cola:
            distancia_actual, nodo_actual = heapq.heappop(cola)
            if distancia_actual > distancias[nodo_actual]:
                continue
            for vecino in self.graph[nodo_actual]:
                distancia = distancia_actual + self.graph[nodo_actual][vecino]['distancia']
                tiempo = rutas[nodo_actual]['tiempo'] + self.graph[nodo_actual][vecino]['tiempo']
                if distancia < distancias[vecino]:
                    distancias[vecino] = distancia
                    rutas[vecino]['distancia'] = distancia
                    rutas[vecino]['ruta'] = rutas[nodo_actual]['ruta'] + [vecino]
                    rutas[vecino]['tiempo'] = tiempo
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
