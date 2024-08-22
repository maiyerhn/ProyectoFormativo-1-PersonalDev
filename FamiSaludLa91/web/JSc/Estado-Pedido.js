document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.form-select').forEach(function(select) {
        select.addEventListener('change', function() {
            const pedidoId = this.dataset.pedidoId;
            const nuevoEstado = this.value;
            fetch('/FamiSaludLa91/CtrPedido?accion=actualizarEstado', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    id: pedidoId,
                    estado: nuevoEstado
                })
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    console.log("DataSucces");
                } else {
                    alert('Error al actualizar el estado. Por favor, inténtalo de nuevo.');
                }
            })
            .catch(error => {
                console.log('Detalles del error:', error);
                console.error('Error:', error.message);
                alert('Ocurrió un error inesperado. Por favor, inténtalo de nuevo.');
            })
        });
    });
});

