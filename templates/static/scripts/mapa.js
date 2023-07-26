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

        rutaPolyline.setMap(mapa);
    }
}