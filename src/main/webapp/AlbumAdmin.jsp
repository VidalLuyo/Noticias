<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pe.edu.vallegrande.controller.AlbumController" %>
<%@ page import="pe.edu.vallegrande.model.AlbumDTO" %>
<%@ page import="java.util.List" %>

<%
    // Inicializar el controlador de álbumes
    AlbumController albumController = new AlbumController();
    List<AlbumDTO> albums = albumController.listarTodas(); // Obtener la lista de álbumes
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome para iconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Estilos personalizados -->
    <style>
        :root {
            --primary-color: #0056b3;
            --secondary-color: #495057;
            --sidebar-width: 250px;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }

        .sidebar {
            width: var(--sidebar-width);
            background-color: var(--primary-color);
            color: #fff;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            padding: 20px;
            transition: all 0.3s;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        .sidebar-menu .nav-link {
            color: rgba(255, 255, 255, 0.8);
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 1.1rem;
        }

        .sidebar-menu .nav-link.active,
        .sidebar-menu .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
        }

        .content-wrapper {
            margin-left: var(--sidebar-width);
            padding: 40px;
            transition: all 0.3s;
        }

        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 12px 20px;
        }

        .navbar-brand {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .navbar-nav .nav-link {
            color: var(--secondary-color);
            margin-left: 20px;
        }

        .navbar-nav .nav-link.active,
        .navbar-nav .nav-link:hover {
            color: var(--primary-color);
        }

        .btn-custom {
            background-color: var(--primary-color);
            color: white;
            border-radius: 50px;
            padding: 8px 20px;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-custom:hover,
        .btn-custom:focus {
            background-color: #004085;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .btn-danger-custom {
            background-color: #dc3545;
            color: white;
            border-radius: 50px;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-danger-custom:hover,
        .btn-danger-custom:focus {
            background-color: #c82333;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .table-custom th,
        .table-custom td {
            vertical-align: middle;
            text-align: center;
        }

        .table-custom th {
            background-color: #f1f1f1;
            color: #333;
            font-weight: 600;
        }

        .modal-content {
            border-radius: 10px;
        }

        .form-control {
            border-radius: 5px;
            box-shadow: none;
        }
    </style>
    <style>
        .nav-link i {
            margin-right: 8px;  /* Espaciado entre el icono y el texto */
            font-size: 1.2rem;   /* Tamaño más grande de los íconos */
        }

        .nav-link.active {
            font-weight: bold;
            color: #007bff; /* Color azul para el enlace activo */
        }

        .nav-link {
            font-size: 1rem;  /* Tamaño de texto */
            color: #333;      /* Color de texto por defecto */
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #007bff;   /* Color de texto al pasar el mouse */
        }

        .nav-link:focus {
            outline: none; /* Eliminar el borde al hacer foco en los enlaces */
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="sidebar-brand">
        Mi Empresa
    </div>
    <div class="sidebar-menu">
        <nav class="nav flex-column">
            <a class="nav-link active" href="#">
                <i class="fas fa-chalkboard-teacher"></i> Docentes
            </a>
            <a class="nav-link" href="#">
                <i class="fas fa-book-open"></i> Contenido 1
            </a>
            <a class="nav-link" href="#">
                <i class="fas fa-file-alt"></i> Contenido 2
            </a>
            <a class="nav-link" href="#">
                <i class="fas fa-camera-retro"></i> Álbum de Fotos
            </a>
            <a class="nav-link" href="#">
                <i class="fas fa-book"></i> Contenido 3
            </a>
            <a class="nav-link" href="#">
                <i class="fas fa-images"></i> Contenido 4
            </a>
        </nav>
    </div>
</div>

<div class="content-wrapper">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <button class="btn btn-primary me-3" id="toggleSidebar">
                <i class="fas fa-bars"></i>
            </button>
            <a class="navbar-brand" href="#">Panel de Administración</a>
            <div class="ms-auto">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user me-2"></i> Nombre Usuario
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="#">Perfil</a></li>
                            <li><a class="dropdown-item" href="#">Configuración</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Cerrar Sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid mt-4">
        <h1>Gestión de Álbumes</h1>

        <!-- Botón para agregar nuevo álbum -->
        <button class="btn btn-custom mb-4" data-bs-toggle="modal" data-bs-target="#addAlbumModal">Agregar Álbum</button>

        <!-- Tabla de Álbumes -->
        <table class="table table-bordered table-custom">
            <thead>
            <tr>
                <th>ID</th>
                <th>Imagen</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <% for (AlbumDTO album : albums) { %>
            <tr>
                <td><%= album.getId() %></td>
                <td><img src="<%= album.getImg() %>" alt="Imagen Álbum" width="50"></td>
                <td>
                    <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editAlbumModal<%= album.getId() %>">Editar</button>
                    <form action="AlbumServlet" method="POST" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= album.getId() %>">
                        <button type="submit" class="btn btn-danger-custom btn-sm">Eliminar</button>
                    </form>
                </td>
            </tr>

            <!-- Modal para editar álbum -->
            <div class="modal fade" id="editAlbumModal<%= album.getId() %>" tabindex="-1" aria-labelledby="editAlbumModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="AlbumServlet" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" value="<%= album.getId() %>">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editAlbumModalLabel">Editar Álbum</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group mb-3">
                                    <label>Imagen Actual:</label><br>
                                    <img src="<%= album.getImg() %>" alt="Imagen Actual" class="img-thumbnail" width="150">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="newImg<%= album.getId() %>">Nueva Imagen (opcional):</label>
                                    <input type="file" id="newImg<%= album.getId() %>" class="form-control-file" name="newImg">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">Guardar Cambios</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal para agregar nuevo álbum -->
<div class="modal fade" id="addAlbumModal" tabindex="-1" aria-labelledby="addAlbumModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="AlbumServlet" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="action" value="add">
                <div class="modal-header">
                    <h5 class="modal-title" id="addAlbumModalLabel">Agregar Álbum</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group mb-3">
                        <label for="img">Imagen:</label>
                        <input type="file" id="img" class="form-control-file" name="img" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-custom">Agregar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Función para alternar la visibilidad de la sidebar
    document.getElementById('toggleSidebar').addEventListener('click', function() {
        document.querySelector('.sidebar').classList.toggle('d-none');
        document.querySelector('.content-wrapper').classList.toggle('ms-0');
        document.querySelector('.content-wrapper').style.marginLeft = document.querySelector('.sidebar').classList.contains('d-none') ? '0' : 'var(--sidebar-width)';
    });
</script>
</body>
</html>
