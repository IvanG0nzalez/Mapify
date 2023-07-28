// Script unificado para búsqueda de bloques, nodos y administradores

// Función para búsqueda de bloques
function buscarBloques() {
    const busquedaBloqueInput = document.getElementById('busqueda_bloque');
    const filasBloque = document.getElementsByClassName('fila-bloque');

    const busqueda = busquedaBloqueInput.value.toLowerCase();
    let bloquesCoincidentes = false;

    for (const fila of filasBloque) {
        const contenidoFila = fila.innerText.toLowerCase();
        fila.style.display = contenidoFila.includes(busqueda) ? 'table-row' : 'none';

        if (contenidoFila.includes(busqueda)) {
            bloquesCoincidentes = true;
        }
    }

    const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
    sinCoincidenciasRow.style.display = bloquesCoincidentes ? 'none' : 'table-row';
}

// Función para búsqueda de nodos
function buscarNodos() {
    const busquedaNodoInput = document.getElementById('busqueda_nodo');
    const filasNodo = document.getElementsByClassName('fila-nodo');

    const busqueda = busquedaNodoInput.value.toLowerCase();

    for (const fila of filasNodo) {
        const codigo = fila.querySelector('.codigo').innerText.toLowerCase();
        const mostrarFila = codigo.includes(busqueda);
        fila.style.display = mostrarFila ? 'table-row' : 'none';
    }

    const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
    const bloquesCoincidentes = [...filasNodo].some(fila => fila.style.display !== 'none');
    sinCoincidenciasRow.style.display = bloquesCoincidentes ? 'none' : 'table-row';
}

// Función para búsqueda de administradores
function buscarAdministradores() {
    const busquedaAdminInput = document.getElementById('busqueda_admin');
    const filasAdmin = document.getElementsByClassName('fila-admin');

    const busqueda = busquedaAdminInput.value.toLowerCase();
    let adminsCoincidentes = false;

    for (const fila of filasAdmin) {
        const contenidoUsername = fila.querySelector('.username').innerText.toLowerCase();
        const contenidoEmail = fila.querySelector('.email').innerText.toLowerCase();

        const coincideUsername = contenidoUsername.includes(busqueda);
        const coincideEmail = contenidoEmail.includes(busqueda);

        fila.style.display = coincideUsername || coincideEmail ? 'table-row' : 'none';

        if (coincideUsername || coincideEmail) {
            adminsCoincidentes = true;
        }
    }

    const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
    sinCoincidenciasRow.style.display = adminsCoincidentes ? 'none' : 'table-row';
}

function buscarNodoConexion(){
    const busquedaNodoConexionInput = document.getElementById('busqueda_nodo_conexion');
    const opcionesNodo = document.getElementsByClassName('opcion_conexion');
    const  selecNodo = document.getElementById('nodo');
    const sinResultadosOption = document.getElementById('sin_resultados');

    busquedaNodoConexionInput.oninput = function () {
        const busqueda = busquedaNodoConexionInput.value.toLowerCase();

        let primeraOpcionVisible = null;
        let nodosCoincidentes = false;

        for (const opcion of opcionesNodo) {
            const codigoNodo = opcion.innerText.toLowerCase();
            opcion.style.display = codigoNodo.includes(busqueda) ? 'block' : 'none';

            if (codigoNodo.includes(busqueda) && primeraOpcionVisible === null) {
                primeraOpcionVisible = opcion;
            }

            if (codigoNodo.includes(busqueda)) {
                nodosCoincidentes = true;
            }
        }

        if (primeraOpcionVisible) {
            selecNodo.value = primeraOpcionVisible.value;
        } else {
            selecNodo.value = '';
        }

        if (nodosCoincidentes) {
            sinResultadosOption.style.display = 'none';
        } else {
            sinResultadosOption.style.display = 'block';
            selecNodo.value = '';
        }
    };
}
document.addEventListener('DOMContentLoaded', function () {
    const busquedaBloqueInput = document.getElementById('busqueda_bloque');
    const busquedaNodoInput = document.getElementById('busqueda_nodo');
    const busquedaAdminInput = document.getElementById('busqueda_admin');
    const busquedaNodoConexionInput = document.getElementById('busqueda_nodo_conexion');
    if(busquedaBloqueInput){
        busquedaBloqueInput.oninput = buscarBloques;
    }
    if(busquedaNodoInput){
        busquedaNodoInput.oninput = buscarNodos;
    }
    if(busquedaAdminInput){
        busquedaAdminInput.oninput = buscarAdministradores;
    }
    if(busquedaNodoConexionInput){
        busquedaNodoConexionInput.oninput = buscarNodoConexion;
    }
});
