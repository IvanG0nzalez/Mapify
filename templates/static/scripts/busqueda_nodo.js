/*document.addEventListener('DOMContentLoaded', function (){
    const busquedaNodoInput = document.getElementById('busqueda_nodo');
    const filasNodo = document.getElementsByClassName('fila-nodo');

    busquedaNodoInput.oninput = function () {
        const busqueda = busquedaNodoInput.value.toLowerCase();

        let nodosCoincidentes = false;

        for (const fila of filasNodo) {
            const contenidoFila = fila.innerText.toLowerCase();
            fila.style.display = contenidoFila.includes(busqueda) ? 'table-row' : 'none';

            if (contenidoFila.includes(busqueda)) {
                nodosCoincidentes = true;
            }
        }

        if (!nodosCoincidentes) {
            const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
            sinCoincidenciasRow.style.display = 'table-row';
        } else {
            const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
            sinCoincidenciasRow.style.display = 'none';
        }
    };
});*/
document.addEventListener('DOMContentLoaded', function () {
    const busquedaNodoInput = document.getElementById('busqueda_nodo');
    const filasNodo = document.getElementsByClassName('fila-nodo');

    busquedaNodoInput.oninput = function () {
        const busqueda = busquedaNodoInput.value.toLowerCase();

        for (const fila of filasNodo) {
            const codigo = fila.querySelector('.codigo').innerText.toLowerCase();


            const mostrarFila = codigo.includes(busqueda);

            fila.style.display = mostrarFila ? 'table-row' : 'none';
        }

        const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
        const bloquesCoincidentes = [...filasNodo].some(fila => fila.style.display !== 'none');

        sinCoincidenciasRow.style.display = bloquesCoincidentes ? 'none' : 'table-row';
    };
});