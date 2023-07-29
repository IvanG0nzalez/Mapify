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
            opcion.style.display = codigoBloque.includes(busqueda) ? 'block' : 'none';
            if(codigoBloque.includes(busqueda) && primeraOpcionVisible == null){
                primeraOpcionVisible = opcion;
            }

            if (codigoBloque.includes(busqueda)){
                bloquesCoincidentes = true;
            }
        }
        if(primeraOpcionVisible){
            selectBloque.value = primeraOpcionVisible.value;
        }else{
            selectBloque.value= '';
        }
        if (bloquesCoincidentes){
            sinResultadosOption.style.display = 'none';
        }else{
            sinResultadosOption.style.display = 'block';
            selectBloque.value = '';
        }
    }
}

function buscarBloqueDestino(){
    const busquedaBloqueDestinoInput = document.getElementById('buscar_bloque_destino');
    const opcionesBloques = document.getElementsByClassName('opcion_bloque');
    const selectBloque = document.getElementById('bloque_destino');
    const sinResultadosOption = document.getElementById('sin_resultados');

    busquedaBloqueDestinoInput.oninput = function (){
        const busqueda = busquedaBloqueDestinoInput.value.toLowerCase();
        let primeraOpcionVisible = null;
        let bloquesCoincidentes = false;
        for (const opcion of opcionesBloques){
            const codigoBloque = opcion.innerText.toLowerCase();
            opcion.style.display = codigoBloque.includes(busqueda) ? 'block' : 'none';
            if(codigoBloque.includes(busqueda) && primeraOpcionVisible == null){
                primeraOpcionVisible = opcion;
            }

            if (codigoBloque.includes(busqueda)){
                bloquesCoincidentes = true;
            }
        }
        if(primeraOpcionVisible){
            selectBloque.value = primeraOpcionVisible.value;
        }else{
            selectBloque.value= '';
        }
        if (bloquesCoincidentes){
            sinResultadosOption.style.display = 'none';
        }else{
            sinResultadosOption.style.display = 'block';
            selectBloque.value = '';
        }
    }
}

document.addEventListener('DOMContentLoaded', function (){
    const busquedaBloqueOrigenInput = document.getElementById('buscar_bloque_origen');
    const busquedaBloqueDestinoInput = document.getElementById('buscar_bloque_destino');
    if(busquedaBloqueOrigenInput){
        busquedaBloqueOrigenInput.oninput = buscarBloqueOrigen;
    }
    if(busquedaBloqueDestinoInput){
        busquedaBloqueDestinoInput.oninput = buscarBloqueDestino;
    }
});
