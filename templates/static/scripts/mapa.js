function initMap() {

    var mapa = new google.maps.Map(document.getElementById('mapa'), {
        center: {lat: -4.032785, lng: -79.202424},
        zoom: 18
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

        var marcadorInicio = new google.maps.Marker({
        position: routeCoordinates[0],
        map: mapa,
        });
         var marcadorFin = new google.maps.Marker({
        position: routeCoordinates[routeCoordinates.length - 1],
        map: mapa,
        });

         var contenidoInfoWindowInicio = 'Este es el punto de inicio';
         var contenidoInfoWindowFin = 'Este es el punto de destino';
         var infoWindowInicio = new google.maps.InfoWindow({content: contenidoInfoWindowInicio});
         var infoWindowFin = new google.maps.InfoWindow({content: contenidoInfoWindowFin});
         infoWindowInicio.open(mapa, marcadorInicio);
         infoWindowFin.open(mapa, marcadorFin);
         marcadorInicio.addListener('click', function() {infoWindowInicio.open(mapa, marcadorInicio);});
         marcadorFin.addListener('click', function() {infoWindowFin.open(mapa, marcadorFin);});

        rutaPolyline.setMap(mapa);
    }
}