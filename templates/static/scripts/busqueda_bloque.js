document.addEventListener('DOMContentLoaded', function (){
    const busquedaBloqueInput = document.getElementById('busqueda_bloque');
    const filasBloque = document.getElementsByClassName('fila-bloque');

    busquedaBloqueInput.oninput = function () {
        const busqueda = busquedaBloqueInput.value.toLowerCase();

        let bloquesCoincidentes = false;

        for (const fila of filasBloque) {
            const contenidoFila = fila.innerText.toLowerCase();
            fila.style.display = contenidoFila.includes(busqueda) ? 'table-row' : 'none';

            if (contenidoFila.includes(busqueda)) {
                bloquesCoincidentes = true;
            }
        }

        if (!bloquesCoincidentes) {
            const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
            sinCoincidenciasRow.style.display = 'table-row';
        } else {
            const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
            sinCoincidenciasRow.style.display = 'none';
        }
    };
});
