/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    var overlay = $('.overlay');
    var customConfirm = $('.custom-confirm');
    var btnConfirm = $('.btn-confirm');
    var btnCancel = $('.btn-cancel');
    var deleteButton;

    $(document).on('click', 'button.btn-eliminar', function () {
        deleteButton = $(this);
        overlay.show();
        customConfirm.show();
    });

    btnConfirm.click(function () {
        var idp = deleteButton.data('id');
        var url = '/FamiSaludLa91/CtrProductos?accion=EliminarDeCarrito';

        $.ajax({
            type: 'POST',
            url: url,
            data: {idp: idp},
            success: function (response) {
                $.get('/FamiSaludLa91/CtrProductos?accion=Carrito', function (data) {
                    $('.carrito-contenido').html(data);
                    overlay.hide();
                    customConfirm.hide();
                });
            },
            error: function (xhr, status, error) {
                console.error('Error al eliminar el producto del carrito:', error);
                overlay.hide();
                customConfirm.hide();
            }
        });
    });

    btnCancel.click(function () {
        overlay.hide();
        customConfirm.hide();
    });

    overlay.click(function () {
        overlay.hide();
        customConfirm.hide();
    });
});