<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración - Colegio San José</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #1a5f7a;
            --secondary-color: #2c3e50;
        }

        .sidebar {
            background-color: var(--secondary-color);
            min-height: 100vh;
            color: white;
        }

        .content-section {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .nav-link {
            color: rgba(255,255,255,0.8);
        }

        .nav-link:hover {
            color: white;
            background-color: rgba(255,255,255,0.1);
        }

        .nav-link.active {
            background-color: var(--primary-color);
            color: white;
        }

        .preview-image {
            max-width: 200px;
            max-height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 col-lg-2 sidebar py-3">
            <div class="d-flex flex-column">
                <div class="text-center mb-4">
                    <img src="/api/placeholder/150/60" alt="Logo" class="mb-3">
                    <h5>Panel de Administración</h5>
                </div>

                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#hero-section">
                            <i class="fas fa-home me-2"></i> Sección Hero
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#news-section">
                            <i class="fas fa-newspaper me-2"></i> Noticias
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#features-section">
                            <i class="fas fa-star me-2"></i> Características
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#stats-section">
                            <i class="fas fa-chart-bar me-2"></i> Estadísticas
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#events-section">
                            <i class="fas fa-calendar me-2"></i> Eventos
                        </a>
                    </li>
                </ul>

                <div class="mt-auto">
                    <a href="logout.jsp" class="nav-link text-danger">
                        <i class="fas fa-sign-out-alt me-2"></i> Cerrar Sesión
                    </a>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 py-4">
            <h2 class="mb-4">Gestión de Contenido</h2>

            <!-- Hero Section Editor -->
            <div class="content-section" id="hero-section">
                <h3 class="mb-4">Sección Hero</h3>
                <form class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Título Principal</label>
                        <input type="text" class="form-control" value="Colegio San José">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Subtítulo</label>
                        <input type="text" class="form-control" value="Formando líderes del mañana con valores y excelencia académica">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Imagen de Fondo</label>
                        <input type="file" class="form-control">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </form>
            </div>

            <!-- News Section Editor -->
            <div class="content-section" id="news-section">
                <h3 class="mb-4">Gestión de Noticias</h3>

                <!-- Noticia Principal -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="mb-0">Noticia Principal</h5>
                    </div>
                    <div class="card-body">
                        <form class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Título</label>
                                <input type="text" class="form-control" value="Estudiantes Ganan Competencia Nacional de Ciencias">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Categoría</label>
                                <select class="form-select">
                                    <option>Destacado</option>
                                    <option>Académico</option>
                                    <option>Deportes</option>
                                    <option>Cultura</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Contenido</label>
                                <textarea class="form-control" rows="4">Nuestros alumnos obtuvieron el primer lugar en la Olimpiada Nacional de Ciencias...</textarea>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Imagen</label>
                                <input type="file" class="form-control">
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">Actualizar Noticia</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Lista de Noticias -->
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Título</th>
                            <th>Categoría</th>
                            <th>Fecha</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Equipo de Fútbol Clasifica a Semifinales</td>
                            <td><span class="badge bg-success">Deportes</span></td>
                            <td>23/10/2024</td>
                            <td>
                                <button class="btn btn-sm btn-primary me-1"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>Festival de Arte y Cultura 2024</td>
                            <td><span class="badge bg-info">Arte</span></td>
                            <td>22/10/2024</td>
                            <td>
                                <button class="btn btn-sm btn-primary me-1"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <button class="btn btn-success">
                    <i class="fas fa-plus me-2"></i>Agregar Nueva Noticia
                </button>
            </div>

            <!-- Features Section Editor -->
            <div class="content-section" id="features-section">
                <h3 class="mb-4">Características Destacadas</h3>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <h5>Excelencia Académica</h5>
                                <div class="mb-3">
                                    <label class="form-label">Título</label>
                                    <input type="text" class="form-control" value="Excelencia Académica">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Descripción</label>
                                    <textarea class="form-control">Programas educativos de alto nivel con profesores calificados</textarea>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Ícono</label>
                                    <select class="form-select">
                                        <option value="graduation-cap">Graduación</option>
                                        <option value="book">Libro</option>
                                        <option value="users">Usuarios</option>
                                    </select>
                                </div>
                                <button class="btn btn-primary">Actualizar</button>
                            </div>
                        </div>
                    </div>
                    <!-- Añadir más características aquí -->
                </div>
            </div>

            <!-- Statistics Section Editor -->
            <div class="content-section" id="stats-section">
                <h3 class="mb-4">Estadísticas</h3>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <h5>Años de Experiencia</h5>
                                <input type="number" class="form-control mb-3" value="45">
                                <button class="btn btn-primary">Actualizar</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <h5>Número de Estudiantes</h5>
                                <input type="number" class="form-control mb-3" value="1200">
                                <button class="btn btn-primary">Actualizar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Events Section Editor -->
            <div class="content-section" id="events-section">
                <h3 class="mb-4">Gestión de Eventos</h3>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Evento</th>
                            <th>Fecha</th>
                            <th>Descripción</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Feria de Ciencias 2024</td>
                            <td>15/11/2024</td>
                            <td>Exhibición de proyectos científicos...</td>
                            <td>
                                <button class="btn btn-sm btn-primary me-1"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <button class="btn btn-success">
                    <i class="fas fa-plus me-2"></i>Agregar Nuevo Evento
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>