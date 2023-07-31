import heapq
import math

import networkx as nx
from pymongo import MongoClient


class ControladorGrafo:
    def __init__(self):
        self.graph = None
        self.data_db = None

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

    #Accede a la base de datos y obtiene todos los registros de nodos existentes
    def obtener_nodos_db(self):

        if self.data_db:
            return self.data_db

        cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
        client = MongoClient(cadenaConexion)
        db = client['ProyectoIntegrador']
        coleccion = db['nodos']

        data = list(coleccion.find())

        client.close()
        return data

    def crear_grafo(self):
        #Asigna todos los nodos obtenidos a la variable
        data_db = self.obtener_nodos_db()
        #Inicializa un grafo vacío
        self.graph = nx.Graph()
        #Recorre la vairbale data_db y asigna los registros a un nuevo nodo del grafo
        for nodo in data_db:
            codigo = nodo['codigo']
            latitud = nodo['latitud']
            altitud = nodo['altitud']
            self.graph.add_node(codigo, latitud=latitud, altitud=altitud)
        #Recorre la variable data_db y obtiene la lista de conexiones de cada nodo
        for nodo in data_db:
            codigo_origen = nodo['codigo']
            conexiones = nodo['conexiones']
            latitud_origen = nodo['latitud']
            altitud_origen = nodo['altitud']
            #Para cada conexión crea una arista con la distancia y tiempo calculados
            for codigo_destino in conexiones:
                if self.graph.has_node(codigo_destino):
                    nodo_destino = next((n for n in data_db if n['codigo'] == codigo_destino), None)
                    if nodo_destino:
                        latitud_destino = nodo_destino['latitud']
                        altitud_destino = nodo_destino['altitud']

                        distancia = self.calcular_distancia((latitud_origen, altitud_origen), (latitud_destino, altitud_destino))

                        tiempo = self.calcular_tiempo(distancia)

                        self.graph.add_edge(codigo_origen, codigo_destino, distancia=distancia, tiempo=tiempo)
                    else:
                        print(f"Graph Controller: La conexión {codigo_origen} -> {codigo_destino} no pudo establecerse: Nodo de destino inexistente.")
                else:
                    print(f"Graph Controller: La conexión {codigo_origen} -> {codigo_destino} no pudo establecerse: Nodo de destino inexistente.")

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

    def obtener_grafo(self):
        return self.graph

    def obtener_coordenadas_por_codigo(self, codigo):
        if not self.data_db:
            self.data_db = self.obtener_nodos_db()

        for nodo in self.data_db:
            codigo_nodo_db = nodo['codigo']
            if codigo_nodo_db == codigo:
                latitud = nodo['latitud']
                altitud = nodo['altitud']
                #coordenadas = {'latitud': latitud, 'altitud': altitud}
                return latitud, altitud
        return None


class NodoNoExisteException(Exception):
    def __init__(self, mensaje):
        super().__init__(mensaje)