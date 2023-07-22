function initMap() {
    // Coordenadas del centro del mapa
    var center = {lat: -4.032785, lng: -79.202424};

    // Configurar las opciones del mapa
    var mapOptions = {
        center: center,
        zoom: 50 // Nivel de zoom del mapa
    };

    // Crear el mapa en el <div> con id "mapa"
    var map = new google.maps.Map(document.getElementById('mapa'), mapOptions);

    // Agregar marcadores, rutas u otros elementos al mapa si es necesario
    // Por ejemplo, para agregar un marcador en la ubicación de la universidad:
    var marker = new google.maps.Marker({
        position: center,
        map: map,
        title: 'Universidad'
    });
}

initMap()


