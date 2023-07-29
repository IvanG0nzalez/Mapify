function buscarBloqueOrigen(){
    const busquedaBloqueOrigenInput = document.getElementById('buscar_bloque_origen');
    const opcionesBloques = document.getElementsByClassName('opcion_bloque');
    const selectBloque = document.getElementById('bloque_origen');
    const sinResultadosOption = document.getElementById('sin_resultados');

    busquedaBloqueOrigenInput.oninput = function (){
        const busqueda = busquedaBloqueOrigenInput.value.toLowerCase();

        let primeraOpcionVisible = null;
        let bloquesCoincidentes = false;

        for (const opcion of opcionesBloques){
            const codigoBloque = opcion.innerText.toLowerCase();
            
        }
    }

}