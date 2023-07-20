from django.test import TestCase

# Create your tests here.
from pymongo import MongoClient

from Mapeo.graph_controller import ControladorGrafo

cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
client = MongoClient(cadenaConexion)
db = client['ProyectoIntegrador']

"""
registro = db.get_collection('nodos').find_one({'_id':5})

if registro:
    for campo, valor in registro.items():
        print(f"{campo}: {valor}")
else:
    print("El registro no existe")
"""

"""
documento_existente = db.nodos.find_one({'_id': 1})
if documento_existente:
    documento_existente['conexiones'].append("N3")
    db.nodos.update_one(
        {'_id': 1},
        {'$set': {'conexiones': documento_existente['conexiones']}}
    )
"""

controlador_grafo = ControladorGrafo()
controlador_grafo.crear_grafo()

origen = 'A1'
rutas = controlador_grafo.minimo_dijkstra(origen)
#print(f"Distancia mínimas desde {origen}: {distancias}")
#print(f"Rutas mínimas desde {origen}: {rutas}")
"""
print(f"Distancias desde {origen}:")
for nodo, distancia in distancias.items():
    print(f"{nodo}: {distancia}")
"""
print(f"\nDistancias, rutas y tiempos desde {origen}:")
for nodo, ruta in rutas.items():
    print(f"{nodo}: {ruta}")