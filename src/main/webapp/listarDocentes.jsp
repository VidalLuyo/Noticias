<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pe.edu.vallegrande.controller.TituloController" %>
<%@ page import="pe.edu.vallegrande.controller.DocenteController" %>
<%@ page import="pe.edu.vallegrande.controller.MasNoticiasController" %>
<%@ page import="pe.edu.vallegrande.controller.ContenidoController" %>
<%@ page import="pe.edu.vallegrande.model.TituloDTO" %>
<%@ page import="pe.edu.vallegrande.model.DocenteDTO" %>
<%@ page import="pe.edu.vallegrande.model.MasNoticiasDTO" %>
<%@ page import="pe.edu.vallegrande.model.ContenidoDTO" %>
<%@ page import="java.util.List" %>

<%
    // Controladores
    TituloController tituloController = new TituloController();
    DocenteController docenteController = new DocenteController();
    MasNoticiasController noticiasController = new MasNoticiasController();
    ContenidoController contenidoController = new ContenidoController();

    // Obtener datos
    List<TituloDTO> titulos = tituloController.listarTodos();
    List<DocenteDTO> docentes = docenteController.listarTodos();
    List<MasNoticiasDTO> noticias = noticiasController.listarTodas();
    List<ContenidoDTO> contenidos = contenidoController.listarTodos();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        #sidebar {
            width: 250px;
            background-color: #1a1a2e;
            color: #fff;
            position: fixed;
            height: 100%;
        }
        #sidebar .nav-link {
            color: #ddd;
            font-weight: 500;
        }
        #sidebar .nav-link.active {
            background-color: #162447;
            color: #fff;
        }
        #sidebar .nav-link:hover {
            color: #fff;
        }
        #navbar {
            background-color: #1a1a2e;
            color: #fff;
        }
        #content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }
        .table img {
            width: 50px;
            height: auto;
        }
        .sidebar-header {
            padding: 15px;
            font-size: 1.5em;
            background-color: #162447;
            text-align: center;
        }
        .nav-item i {
            margin-right: 10px;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div id="sidebar">
    <div class="sidebar-header">
        <i class="fas fa-globe"></i> EL PLANETA
    </div>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="#titulos" data-bs-toggle="tab"><i class="fas fa-home"></i> Panel</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#docentes" data-bs-toggle="tab"><i class="fas fa-users"></i> Docentes</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#noticias" data-bs-toggle="tab"><i class="fas fa-newspaper"></i> Noticias</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#contenidos" data-bs-toggle="tab"><i class="fas fa-book"></i> Contenidos</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><i class="fas fa-cog"></i> Configuración</a>
        </li>
    </ul>
</div>

<!-- Navbar -->
<nav id="navbar" class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <span class="navbar-brand">Panel de Administración</span>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-bell"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user"></i> Jesús Luyo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div id="content">
    <div class="container">
        <h1 class="mb-4">Bienvenido al Panel de Administración</h1>
        <div class="tab-content">
            <!-- Títulos -->
            <div id="titulos" class="tab-pane fade show active">
                <h3>Títulos</h3>
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Descripción</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (TituloDTO titulo : titulos) {
                    %>
                    <tr>
                        <td><%= titulo.getId() %></td>
                        <td><%= titulo.getTitulo() %></td>
                        <td><%= titulo.getDescripcion() %></td>
                        <td><img src="<%= titulo.getImg() %>" alt="Imagen"></td>
                        <td>
                            <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- Docentes -->
            <div id="docentes" class="tab-pane fade">
                <h3>Docentes</h3>
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (DocenteDTO docente : docentes) {
                    %>
                    <tr>
                        <td><%= docente.getId() %></td>
                        <td><%= docente.getNombres() %></td>
                        <td><%= docente.getDescripcion2() %></td>
                        <td><img src="<%= docente.getImg() %>" alt="Imagen"></td>
                        <td>
                            <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- Noticias -->
            <div id="noticias" class="tab-pane fade">
                <h3>Noticias</h3>
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Contenido</th>
                        <th>Descripción</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (MasNoticiasDTO noticia : noticias) {
                    %>
                    <tr>
                        <td><%= noticia.getId() %></td>
                        <td><%= noticia.getContenido() %></td>
                        <td><%= noticia.getDescripcion() %></td>
                        <td><img src="<%= noticia.getImg() %>" alt="Imagen"></td>
                        <td>
                            <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <!-- Contenidos -->
            <div id="contenidos" class="tab-pane fade">
                <h3>Contenidos</h3>
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Contenido</th>
                        <th>Descripción</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (ContenidoDTO contenido : contenidos) {
                    %>
                    <tr>
                        <td><%= contenido.getId() %></td>
                        <td><%= contenido.getContenido() %></td>
                        <td><%= contenido.getDescripcion() %></td>
                        <td><img src="<%= contenido.getImg() %>" alt="Imagen"></td>
                        <td>
                            <button class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
