/* 
 esta funcion carga la informacion de una imagen y la coloca en una etiquetea img
 */

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah')
                    .attr('src', e.target.result)
                    .height(200);
        };
        reader.readAsDataUrl(input.files[0]);
    }
}

function addCart(formulario) {
    var idProducto = formulario.elements[0].value;
    var existencias = formulario.elements[1].value;
    if (existencias > 0) {
        var url = "/carrito/agregar/" + idProducto;
        $("#resultsBlock").load(url);
    } else {
        window.alert("No hay existencias...");
    }
}
