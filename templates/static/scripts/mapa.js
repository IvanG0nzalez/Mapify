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


let mapa = L.map('mapa').setView([-4.03348,-79.20223], 17);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(mapa);


var iconoPuerta1 = L.icon({
    iconUrl: '/static/imagenes/MarcadorPuerta1.png',
    iconSize: [40, 40],
    iconAnchor: [16, 32]
});

var iconoPuerta2 = L.icon({
    iconUrl: '/static/imagenes/MarcadorPuerta2.png',
    iconSize: [40, 40],
    iconAnchor: [16, 32]
});

var iconoPuerta3 = L.icon({
    iconUrl: '/static/imagenes/MarcadorPuerta3.png',
    iconSize: [40, 40],
    iconAnchor: [16, 32]
});

var iconoPuerta4 = L.icon({
    iconUrl: '/static/imagenes/MarcadorPuerta4.png',
    iconSize: [40, 40],
    iconAnchor: [16, 32]
});

var iconoPuerta5 = L.icon({
    iconUrl: '/static/imagenes/MarcadorPuerta5.png',
    iconSize: [40, 40],
    iconAnchor: [16, 32]
});

var iconoPuerta6 = L.icon({
    iconUrl: '/static/imagenes/MarcadorPuerta6.png',
    iconSize: [40, 40],
    iconAnchor: [16, 32]
});

// Crea marcadores utilizando los íconos personalizados
var marcadorPuerta1 = L.marker([-4.03294, -79.20244], { icon: iconoPuerta1 }).addTo(mapa);
var marcadorPuerta2 = L.marker([-4.03336, -79.2034], { icon: iconoPuerta2 }).addTo(mapa);
var marcadorPuerta3 = L.marker([-4.03538, -79.20488], { icon: iconoPuerta3 }).addTo(mapa);
var marcadorPuerta4 = L.marker([-4.036, -79.20533], { icon: iconoPuerta4 }).addTo(mapa);
var marcadorPuerta5 = L.marker([-4.03647, -79.20562], { icon: iconoPuerta5 }).addTo(mapa);
var marcadorPuerta6 = L.marker([-4.03274, -79.20018], { icon: iconoPuerta6 }).addTo(mapa);




var routeCoordinates = coordenadas_nodos;

if(routeCoordinates.length > 0){
    L.polyline(routeCoordinates, {
        color: '#125680',
        weight: 7,
        opacity: 0.7,
        shadowBlur: 10,
        shadowColor: 'black'
    }).addTo(mapa);

    var iconoOrigen = L.icon({
    iconUrl: '/static/imagenes/MarcadorOrigen.png',
    iconSize: [70, 65],
    iconAnchor: [30, 50]
    });

    var iconoDestino = L.icon({
        iconUrl: '/static/imagenes/MarcadorDestino.png',
        iconSize: [80, 65],
        iconAnchor: [38, 50]
    });

    // Crea marcadores para el origen y el destino utilizando los íconos personalizados
    var marcadorInicio = L.marker(routeCoordinates[0], { icon: iconoOrigen }).addTo(mapa);
    var marcadorDestino = L.marker(routeCoordinates[routeCoordinates.length - 1], { icon: iconoDestino }).addTo(mapa);


}


