
function seleccionarFila(row) {     // cuando se selecciona una fila de la tabla se autocompleta el texto con el id para buscar
    var firstColumnValue = row.cells[0].textContent;
    var campoTexto = document.getElementById("campoTexto");
    campoTexto.value = firstColumnValue;
}


//Confirmaciones para Administradores
function confirmacionAdminRegistrado(event) {
  alert("Administrador registrado correctamente");
}

function confirmacionAdminModificado(event) {
  alert("Administrador modificado correctamente");
}

function confirmacionEliminarAdmin(event) {
  var resultado = confirm("¿Estás seguro que desea eliminar al administrador?");

  if (!resultado) {
    event.preventDefault();
    alert("Acción cancelada.");
  }
}


//Confirmaciones para Bloques
function confirmacionBloqueRegistrado(event) {
  alert("Bloque registrado correctamente");
}

function confirmacionBloqueModificado(event) {
  alert("Bloque modificado correctamente");
}

function confirmacionEliminarBloque(event) {
  var resultado = confirm("¿Estás seguro que desea eliminar el bloque?");

  if (!resultado) {
    event.preventDefault();
    alert("Acción cancelada.");
  }
}


//Confirmaciones para Facultades
function confirmacionFacultadRegistrada(event) {
  alert("Facultad registrada correctamente");
}

function confirmacionFacultadModificada(event) {
  alert("Facultad modificada correctamente");
}

function confirmacionEliminarFacultad(event) {
  var resultado = confirm("¿Estás seguro que desea eliminar la facultad?");

  if (!resultado) {
    event.preventDefault();
    alert("Acción cancelada.");
  }
}


//Confirmaciones para conexiones
function confirmacionConexionAgregada(event) {
  alert("Conexión realizada correctamente");
}

function confirmacionEliminarConexion(event) {
  var resultado = confirm("¿Estás seguro que desea eliminar la conexión?");

  if (!resultado) {
    event.preventDefault();
    alert("Acción cancelada.");
  }
}
