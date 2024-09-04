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
            var proveedorId = this.getAttribute('data-id');
            confirmDeleteBtn.href = '/FamiSaludLa91/CtrPro?accion=eliminar&idpre=' + proveedorId;
        });
    });

    var urlParams = new URLSearchParams(window.location.search);
    var mensaje = urlParams.get('mensaje');
    
    if (mensaje) {
        var mensajeModal = new bootstrap.Modal(document.getElementById('mensajeModal'));
        var mensajeModalBody = document.getElementById('mensajeModalBody');
        mensajeModalBody.textContent = mensaje;
        mensajeModal.show();

        setTimeout(function () {
            mensajeModal.hide();
        }, 3000);
    }
});
