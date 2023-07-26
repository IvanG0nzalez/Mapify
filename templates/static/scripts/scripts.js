
function seleccionarFila(row) {     // cuando se selecciona una fila de la tabla se autocompleta el texto con el id para buscar
    var firstColumnValue = row.cells[0].textContent;
    var campoTexto = document.getElementById("campoTexto");
    campoTexto.value = firstColumnValue;
}

function mostrarConfirmacion(event) {
  var resultado = confirm("¿Estás seguro de continuar?");

  if (!resultado) {
    event.preventDefault();
    alert("Acción cancelada.");
  }
}