var grafoData = informacion
var grafoOptions = {
    layout: {
        improvedLayout: false
    },
    edges: {
        color: "#000000"
    },
    nodes: {
        shape: "dot",
        size: 20,
        font: {
            size: 12
        }
        },
    physic: {
        minVelocity: 0.75,
        stabilization: true
    },
};
var grafoContainer = document.getElementById('grafoContainer');
var network = new vis.Network(grafoContainer, grafoData, grafoOptions);