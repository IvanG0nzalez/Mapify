function initMap() {

    var mapa = new google.maps.Map(document.getElementById('mapa'), {
        center: {lat: -4.032785, lng: -79.202424},
        zoom: 17
    });

    var marcadorPuerta1 = crearMarcador(mapa, {"lat": -4.03294, "lng": -79.20244}, 'PUERTA 1');
    var marcadorPuerta2 = crearMarcador(mapa, {"lat": -4.03336, "lng": -79.2034}, 'PUERTA 2');
    var marcadorPuerta3 = crearMarcador(mapa, {"lat": -4.03538, "lng": -79.20488}, 'PUERTA 3');
    var marcadorPuerta4 = crearMarcador(mapa, {"lat": -4.036, "lng":  -79.20533}, 'PUERTA 4');
    var marcadorPuerta5 = crearMarcador(mapa, {"lat": -4.03647, "lng": -79.20562}, 'PUERTA 5');
    var marcadorPuerta6 = crearMarcador(mapa, {"lat": -4.03274, "lng": -79.20018}, 'PUERTA 6');

    var routeCoordinates = coordenadas_nodos;


    if(routeCoordinates.length > 0){

        var rutaPolyline = new google.maps.Polyline({
            path: routeCoordinates,
            geodesic: true,
            strokeColor: '#125680',
            strokeOpacity: 1.0,
            strokeWeight: 10
        });

        var marcadorInicio = new google.maps.Marker({
        position: routeCoordinates[0],
        map: mapa,
        });
         var marcadorFin = new google.maps.Marker({
        position: routeCoordinates[routeCoordinates.length - 1],
        map: mapa,
        });
        console.log(routeCoordinates)
         var contenidoInfoWindowInicio = 'Punto de inicio';
         var contenidoInfoWindowFin = 'Punto de destino';
         var infoWindowInicio = new google.maps.InfoWindow({content: contenidoInfoWindowInicio});
         var infoWindowFin = new google.maps.InfoWindow({content: contenidoInfoWindowFin});
         infoWindowInicio.open(mapa, marcadorInicio);
         infoWindowFin.open(mapa, marcadorFin);
         //marcadorInicio.addListener('click', function() {infoWindowInicio.open(mapa, marcadorInicio);});
         //marcadorFin.addListener('click', function() {infoWindowFin.open(mapa, marcadorFin);});
        marcadorInicio.addListener('click', function() {
          if (infoWindowInicio.getMap()) {
            infoWindowInicio.close();
          } else {
            infoWindowInicio.open(mapa, marcadorInicio);
          }
        });
        marcadorFin.addListener('click', function() {
          if (infoWindowFin.getMap()) {
            infoWindowFin.close();
          } else {
            infoWindowFin.open(mapa, marcadorFin);
          }
        });

        rutaPolyline.setMap(mapa);
    }
}

var nodoOrigenSelect = document.getElementById('bloque_origen');
var nodoDestinoSelect = document.getElementById('bloque_destino2');
var buscarRutaBtn = document.getElementById('buscarRutaBtn');

buscarRutaBtn.addEventListener('click', function(event){
    var nodoOrigen = nodoOrigenSelect.value;
    var nodoDestino = nodoDestinoSelect.value;

    if(nodoOrigen == nodoDestino){
        alert("Los bloques de origen y destino deben ser diferentes");
        event.preventDefault();
    }
});

function crearMarcador(mapa, position, contenidoInfoWindow) {
    var marcador = new google.maps.Marker({
        position: position,
        map: mapa,
    });

    var infoWindow = new google.maps.InfoWindow({content: contenidoInfoWindow});
    infoWindow.open(mapa, marcador);

    marcador.addListener('click', function() {
        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(mapa, marcador);
        }
    });

    return marcador;
}