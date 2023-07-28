/*document.addEventListener('DOMContentLoaded', function (){
    const busquedaAdminInput = document.getElementById('busqueda_admin');
    const filasAdmin = document.getElementsByClassName('fila-admin');

    busquedaAdminInput.oninput = function () {
        const busqueda = busquedaAdminInput.value.toLowerCase();

        let adminsCoincidentes = false;

        for (const fila of filasAdmin) {
            const contenidoFila = fila.innerText.toLowerCase();
            fila.style.display = contenidoFila.includes(busqueda) ? 'table-row' : 'none';

            if (contenidoFila.includes(busqueda)) {
                adminsCoincidentes = true;
            }
        }

        if (!adminsCoincidentes) {
            const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
            sinCoincidenciasRow.style.display = 'table-row';
        } else {
            const sinCoincidenciasRow = document.getElementById('sin_coincidencias_row');
            sinCoincidenciasRow.style.display = 'none';
        }
    };
});*/
document.addEventListener('DOMContentLoaded', function () {
    const busquedaAdminInput = document.getElementById('busqueda_admin');
    const filasAdmin = document.getElementsByClassName('fila-admin');

    busquedaAdminInput.oninput = function () {
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
    };
});