document.addEventListener('DOMContentLoaded', function (){
   const busquedaNodoInput = document.getElementById('busqueda_nodo_conexion');
   const opcionesNodo = document.getElementsByClassName('opcion_conexion');
   const  selecNodo = document.getElementById('nodo');
   const sinResultadosOption = document.getElementById('sin_resultados');

   busquedaNodoInput.oninput = function () {
       const busqueda = busquedaNodoInput.value.toLowerCase();

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
});