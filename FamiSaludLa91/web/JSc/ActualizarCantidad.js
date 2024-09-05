/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $(document).on('change', 'input.cantidad', function () {

        var idp = $(this).siblings('input.idpro').val();
        var cantidad = $(this).val();
        alert(idp + " " + cantidad);

        alert("entro al JavasCript para actulizar Cantidad");
        var url = '/FamiSaludLa91/CtrProductos?accion=ActualizarCantidad';

        $.ajax({
            type: 'POST',
            url: url,
            data: {idp: idp, Cantidad: cantidad},
            success: function (response) {
                $.get('/FamiSaludLa91/CtrProductos?accion=Carrito', function (data) {
                    $('.carrito-contenido').html(data);
                });
            },
            error: function (xhr, status, error) {
                console.error('Error al actualizar la cantidad:', error);
            }
        });
    });
});


