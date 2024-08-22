/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.addEventListener('DOMContentLoaded', function () {
    var deleteButtons = document.querySelectorAll('a[data-bs-toggle="modal"][data-bs-target="#eliminar"]');
    var confirmDeleteBtn = document.getElementById('confirmDeleteBtn');

    deleteButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            var productoId = this.getAttribute('data-id');
            confirmDeleteBtn.href = '/FamiSaludLa91/CtrProductos?accion=eliminar&ide=' + productoId;
        });
    });

    // Mensaje de eliminacion  :)
    var urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('mensaje')) {
        var mensaje = urlParams.get('mensaje');
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": true,
            "progressBar": true,
            "positionClass": "toast-bottom-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr.success(mensaje, 'Exito');
    }
});
