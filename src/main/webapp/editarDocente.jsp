<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pe.edu.vallegrande.controller.DocenteController" %>
<%@ page import="pe.edu.vallegrande.model.DocenteDTO" %>

<%
    String idParam = request.getParameter("id");
    int id = idParam != null ? Integer.parseInt(idParam) : 0;

    DocenteController docenteController = new DocenteController();
    DocenteDTO docente = docenteController.buscarPorId(id);

    if (docente == null) {
        out.println("<h3 class='text-danger'>Docente no encontrado.</h3>");
        return;
    }

    Boolean successMessage = (Boolean) request.getAttribute("success");
    Boolean errorMessage = (Boolean) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Docente</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container mt-5">
    <h2>Editar Docente</h2>
    <form id="editarDocenteForm" action="ActualizarDocenteServlet" method="post" enctype="multipart/form-data" class="mt-4">
        <input type="hidden" name="id" value="<%= docente.getId() %>">

        <div class="mb-3">
            <label for="nombres" class="form-label">Nombres</label>
            <input type="text" class="form-control" id="nombres" name="nombres"
                   value="<%= docente.getNombres() %>" required>
        </div>

        <div class="mb-3">
            <label for="descripcion2" class="form-label">Descripción</label>
            <textarea class="form-control" id="descripcion2" name="descripcion2" rows="4" required><%= docente.getDescripcion2() %></textarea>
        </div>

        <div class="mb-3">
            <label for="currentImg" class="form-label">Imagen Actual</label>
            <div>
                <img src="<%= docente.getImg() %>" alt="Imagen Actual" width="150">
            </div>
        </div>

        <div class="mb-3">
            <label for="newImg" class="form-label">Nueva Imagen (Opcional)</label>
            <input type="file" class="form-control" id="newImg" name="newImg" accept="image/*">
        </div>

        <button type="button" class="btn btn-primary" id="guardarBtn">Guardar Cambios</button>
        <a href="admin.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<script>
    document.getElementById("guardarBtn").addEventListener("click", function () {
        const nombres = document.getElementById("nombres").value.trim();
        const descripcion = document.getElementById("descripcion2").value.trim();

        if (!nombres || !descripcion) {
            Swal.fire({
                icon: 'warning',
                title: 'Campos Vacíos',
                text: 'Todos los campos deben estar llenos.',
                confirmButtonText: 'Ok'
            });
        } else {
            document.getElementById("editarDocenteForm").submit();
        }
    });

    // Mostrar mensaje de éxito o error basado en los atributos enviados por el servlet
    <% if (successMessage != null && successMessage) { %>
    Swal.fire({
        icon: 'success',
        title: '¡Éxito!',
        text: 'Docente actualizado exitosamente.',
        confirmButtonText: 'Ok'
    }).then(() => {
        window.location.href = "admin.jsp";
    });
    <% } else if (errorMessage != null && errorMessage) { %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: 'Hubo un problema al actualizar el docente.',
        confirmButtonText: 'Ok'
    });
    <% } %>
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
