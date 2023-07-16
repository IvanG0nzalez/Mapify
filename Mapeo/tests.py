from django.test import TestCase

# Create your tests here.
from pymongo import MongoClient

cadenaConexion = 'mongodb+srv://admin:admin1234@cluster0.xataanw.mongodb.net/'
client = MongoClient(cadenaConexion)
db = client['ProyectoIntegrador']

registro = db.get_collection('nodos').find_one({'_id':5})

if registro:
    for campo, valor in registro.items():
        print(f"{campo}: {valor}")
else:
    print("El registro no existe")