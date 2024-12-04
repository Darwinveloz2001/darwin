document.querySelectorAll(".editar-admin").forEach((boton) => {
    boton.addEventListener("click", function () {
      const fila = this.closest("tr");
      const idAdmin = this.getAttribute("data-id");
      const correoActual = fila
        .querySelector("td:nth-child(2)")
        .textContent.trim();
      const contraseñaActual = fila
        .querySelector("td:nth-child(3)")
        .textContent.trim();
      const telefonoActual = fila
        .querySelector("td:nth-child(4)")
        .textContent.trim();
      const codigoActual = fila
        .querySelector("td:nth-child(5)")
        .textContent.trim();
  
      Swal.fire({
        title: "Editar Administrador",
        html: `
          <input type="hidden" id="editIdAdmin" value="${idAdmin}">
          <label>Correo:</label>
          <input id="editCorreo" class="swal2-input" type="email" value="${correoActual}">
          <label>Contraseña:</label>
          <input id="editContraseña" class="swal2-input" type="password" value="${contraseñaActual}">
          <label>Teléfono:</label>
          <input id="editTelefono" class="swal2-input" type="text" value="${telefonoActual}">
          <label>Código:</label>
          <input id="editCodigo" class="swal2-input" type="text" value="${codigoActual}">
        `,
        focusConfirm: false,
        showCancelButton: true,
        confirmButtonText: "Guardar Cambios",
        cancelButtonText: "Cancelar",
        preConfirm: () => {
          const correo = document.getElementById("editCorreo").value.trim();
          const contraseña = document
            .getElementById("editContraseña")
            .value.trim();
          const telefono = document.getElementById("editTelefono").value.trim();
          const codigo = document.getElementById("editCodigo").value.trim();
  
          if (!correo || !contraseña || !telefono || !codigo) {
            Swal.showValidationMessage("Todos los campos son obligatorios");
            return false;
          }
  
          return { idAdmin, correo, contraseña, telefono, codigo };
        },
      }).then((result) => {
        if (result.isConfirmed) {
          fetch("../controllers/editar_admin.php", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(result.value),
          })
            .then((response) => response.json())
            .then((data) => {
              if (data.success) {
                fila.querySelector("td:nth-child(2)").textContent =
                  result.value.correo;
                fila.querySelector("td:nth-child(3)").textContent =
                  result.value.contraseña;
                fila.querySelector("td:nth-child(4)").textContent =
                  result.value.telefono;
                fila.querySelector("td:nth-child(5)").textContent =
                  result.value.codigo;
  
                Swal.fire(
                  "Actualizado",
                  "El administrador ha sido actualizado correctamente.",
                  "success"
                );
              } else {
                Swal.fire(
                  "Error",
                  data.message || "No se pudo actualizar el administrador.",
                  "error"
                );
              }
            })
            .catch((error) => {
              console.error("Error:", error);
              Swal.fire(
                "Error",
                "Hubo un problema al conectar con el servidor.",
                "error"
              );
            });
        }
      });
    });
  });