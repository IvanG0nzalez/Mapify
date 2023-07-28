from django.apps import AppConfig


class MapeoConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'Mapeo'

    """
    def ready(self):
        controlador_grafo = ControladorGrafo()
        controlador_grafo.crear_grafo()
    """