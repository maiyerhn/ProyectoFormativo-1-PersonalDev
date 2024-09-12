/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $('input.cantidad').click(function () {
        var idp = $(this).siblings('input.idpro').val();
        var cantidad = $(this).val();
        var precio = $(this).siblings('input.precio').val();
        var url = '/FamiSaludLa91/CtrProductos?accion=ActualizarCantidad';
        
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + encodeURIComponent(idp) + "&Cantidad=" + encodeURIComponent(cantidad) + "&precio=" + encodeURIComponent(precio),
            success: function (response) {
                location.href = "/FamiSaludLa91/CtrProductos?accion=Carrito";
            },
            error: function (xhr, status, error) {
                console.error('Error al actualizar la cantidad:', error);
            }
        });
    });
});