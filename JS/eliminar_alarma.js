document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.eliminar-alarma').forEach(function(btn) {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const idAlarma = this.getAttribute('data-id');
            
            Swal.fire({
                title: '¿Estás seguro?',
                text: "No podrás revertir esta acción!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, eliminar!'
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch('../controllers/alarma/eliminar_alarma.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: `idAlarma=${idAlarma}`
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire(
                                'Eliminado!',
                                'Alarma eliminada.',
                                'success'
                            ).then(() => {
                                location.reload();  // Recargar la página para actualizar la tabla
                            });
                        } else {
                            Swal.fire(
                                'Error!',
                                'Hubo un error al eliminar la alarma.',
                                'error'
                            );
                        }
                    })
                    .catch((error) => {
                        console.error('Error:', error);
                        Swal.fire(
                            'Error!',
                            'Hubo un error al eliminar la alarma.',
                            'error'
                        );
                    });
                }
            });
        });
    });
});
