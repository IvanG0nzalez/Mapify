function initMap() {

    var mapa = new google.maps.Map(document.getElementById('mapa'), {
        center: {lat: -4.032785, lng: -79.202424},
        zoom: 17
    });

    var IconoPuerta1 = {
        url: '/static/imagenes/MarcadorPuerta1.png',
        scaledSize: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(25, 50)
    };
    var IconoPuerta2 = {
        url: '/static/imagenes/MarcadorPuerta2.png',
        scaledSize: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(25, 50)
    };
    var IconoPuerta3 = {
        url: '/static/imagenes/MarcadorPuerta3.png',
        scaledSize: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(25, 50)
    };
    var IconoPuerta4 = {
        url: '/static/imagenes/MarcadorPuerta4.png',
        scaledSize: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(25, 50)
    };
    var IconoPuerta5 = {
        url: '/static/imagenes/MarcadorPuerta5.png',
        scaledSize: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(25, 50)
    };
    var IconoPuerta6 = {
        url: '/static/imagenes/MarcadorPuerta6.png',
        scaledSize: new google.maps.Size(50, 50),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(25, 50)
    };


    var marcadorPuerta1 = new google.maps.Marker({
        position: {"lat": -4.03294, "lng": -79.20244},
        map: mapa,
        icon: IconoPuerta1
    });
    var marcadorPuerta2 = new google.maps.Marker({
        position: {"lat": -4.03336, "lng": -79.2034},
        map: mapa,
        icon: IconoPuerta2
    });
    var marcadorPuerta3 = new google.maps.Marker({
        position: {"lat": -4.03538, "lng": -79.20488},
        map: mapa,
        icon: IconoPuerta3
    });
    var marcadorPuerta4 = new google.maps.Marker({
        position: {"lat": -4.036, "lng":  -79.20533},
        map: mapa,
        icon: IconoPuerta4
    });
    var marcadorPuerta5 = new google.maps.Marker({
        position: {"lat": -4.03647, "lng": -79.20562},
        map: mapa,
        icon: IconoPuerta5
    });
    var marcadorPuerta6 = new google.maps.Marker({
        position: {"lat": -4.03274, "lng": -79.20018},
        map: mapa,
        icon: IconoPuerta6
    });

    var routeCoordinates = coordenadas_nodos;


    if(routeCoordinates.length > 0){



        var rutaPolyline = new google.maps.Polyline({
            path: routeCoordinates,
            geodesic: true,
            strokeColor: '#125680',
            strokeOpacity: 1.0,
            strokeWeight: 10
        });

        var IconoOrigen = {
            url: '/static/imagenes/MarcadorOrigen.png',
            scaledSize: new google.maps.Size(70, 65),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(30, 50)
        };
        var marcadorInicio = new google.maps.Marker({
            position: routeCoordinates[0],
            map: mapa,
            icon: IconoOrigen
        });

        var IconoDestino = {
            url: '/static/imagenes/MarcadorDestino.png',
            scaledSize: new google.maps.Size(80, 65),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(38, 50)
        };
        var marcadorInicio = new google.maps.Marker({
            position: routeCoordinates[routeCoordinates.length - 1],
            map: mapa,
            icon: IconoDestino
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