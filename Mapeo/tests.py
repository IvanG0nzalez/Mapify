from django.test import TestCase

# Create your tests here.
from pymongo import MongoClient

from Mapeo.graph_controller import ControladorGrafo

cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
client = MongoClient(cadenaConexion)
db = client['ProyectoIntegrador']
"""
documento_existente = db.nodos.find_one({'_id': 1})
if documento_existente:
    documento_existente['conexiones'].append("N3")
    db.nodos.update_one(
        {'_id': 1},
        {'$set': {'conexiones': documento_existente['conexiones']}}
    )

controlador_grafo = ControladorGrafo()
controlador_grafo.crear_grafo()
origen = 'A1'
rutas = controlador_grafo.minimo_dijkstra(origen)
coordenadas = controlador_grafo.obtener_coordenadas_por_codigo('A1')
print(coordenadas)
print(f"\nDistancias, rutas y tiempos desde {origen}:")
for nodo, ruta in rutas.items():
    print(f"{nodo}: {ruta}")
"""
def cambio_auxiliar_bloque():
    from Mapeo.models import Bloque
    try:
        bloque = Bloque.objects.get(pk=8)
        bloque.numero_auxiliar = 1
        bloque.save()
        print("Valor auxiliar del bloque actualizao")
    except Bloque.DoesNotExist:
        print("No se encontró el bloque con es ID")
