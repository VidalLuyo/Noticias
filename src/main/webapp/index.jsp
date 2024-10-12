<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal de Noticias Completo</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/inicio.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top py-3">
    <div class="container-fluid">
        <a class="navbar-brand fs-4" href="#">Seminario Menor</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active fs-5" href="#">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-5" href="#">Mundo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-5" href="#">Política</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-5" href="#">Tecnología</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fs-5" href="#">Deportes</a>
                </li>
            </ul>
            <!-- Formulario de inicio de sesión -->
            <form class="d-flex align-items-center">
                <button class="btn btn-outline-light btn-sm px-4 rounded-pill" type="submit">Iniciar Sesión</button>
            </form>
        </div>
    </div>
</nav>

<!-- Carrusel de Noticias -->
<div id="carouselNoticias" class="carousel slide mt-5" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselNoticias" data-bs-slide-to="0" class="active" aria-current="true"></button>
        <button type="button" data-bs-target="#carouselNoticias" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carouselNoticias" data-bs-slide-to="2"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/img/foto5.jpg" alt="Publicidad derecha" style="width: 2200px; height: 850px; object-fit: cover;">
            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                <h5>Noticia Destacada 1</h5>
                <p>Descripción breve de la noticia principal.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/img/foto2.jpg" alt="Publicidad derecha" style="width: 2200px; height: 850px; object-fit: cover;">
            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                <h5>Noticia Destacada 2</h5>
                <p>Descripción breve de la noticia secundaria.</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/img/foto4.jpg" alt="Publicidad derecha" style="width: 2200px; height: 850px; object-fit: cover;">
            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 p-3 rounded">
                <h5>Noticia Destacada 3</h5>
                <p>Descripción breve de otra noticia importante.</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselNoticias" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselNoticias" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Siguiente</span>
    </button>
</div>

<!-- Contenido Principal -->
<div class="container mt-5">
    <div class="row">
        <!-- Noticias Principales -->
        <div class="col-md-8">
            <h2>Últimas Noticias</h2>
            <div class="row">
                <!-- Tarjeta de Noticia -->
                <div class="col-md-6">
                    <div class="card mb-3">
                        <img src="${pageContext.request.contextPath}/img/foto4.jpg" alt="Publicidad derecha" style="width: 414px; height: 320px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Noticia Principal 1</h5>
                            <p class="card-text">Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal. Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal.Resumen de la noticia principal.
                            </p>

                            <p class="card-text"><small class="text-muted">Hace unas horas</small></p>
                        </div>
                    </div>
                </div>
                <!-- Otra Noticia -->
                <div class="col-md-6">
                    <div class="card mb-3">
                        <img src="${pageContext.request.contextPath}/img/foto1.jpg" alt="Publicidad derecha" style="width: 414px; height: 320px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Noticia Principal 2</h5>
                            <p class="card-text">Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal. Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.
                                Resumen de la noticia principal.Resumen de la noticia principal.
                            </p>
                            <p class="card-text"><small class="text-muted">Hace unas horas</small></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sección de Tendencias -->
            <h3 class="mt-4">Tendencias</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/img/foto2.jpg" alt="Publicidad derecha" style="width: 267px; height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Tendencia 1</h5>
                            <p class="card-text">Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/img/foto3.jpg" alt="Publicidad derecha" style="width: 267px; height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Tendencia 2</h5>
                            <p class="card-text">Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/img/foto4.jpg" alt="Publicidad derecha" style="width: 267px; height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Tendencia 3</h5>
                            <p class="card-text">Resumen de la noticia principal.Resumen de la noticia principal.Resumen de la noticia principal.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sección de Videos -->
            <h3 class="mt-4">Videos Destacados</h3>
            <div class="row">
                <div class="col-md-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Video 1: Innovación en Tecnología</h5>
                            <div class="ratio ratio-16x9">
                                <iframe src="${pageContext.request.contextPath}/Videos/video1.mp4" title="Video 2" allowfullscreen></iframe>
                            </div>
                            <p class="card-text mt-2">Este video muestra los últimos avances en tecnología y cómo están cambiando el mundo.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Video 2: Economía y Finanzas Globales</h5>
                            <div class="ratio ratio-16x9">
                                <iframe src="${pageContext.request.contextPath}/Videos/video1.mp4" title="Video 2" allowfullscreen></iframe>
                            </div>
                            <p class="card-text mt-2">Un análisis detallado de las tendencias económicas y financieras globales.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sección de Galería de Fotos -->
            <section class="gallery-section py-5">
                <h3 class="text-center mb-4">Galería de Fotos</h3>
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="image-container shadow-sm rounded overflow-hidden">
                            <img src="${pageContext.request.contextPath}/img/foto3.jpg" alt="Publicidad derecha" class="img-fluid" style="width: 100%; height: 250px; object-fit: cover;">
                            <div class="image-overlay d-flex justify-content-center align-items-center">
                                <a href="#" class="btn btn-light btn-sm">Ver Detalles</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="image-container shadow-sm rounded overflow-hidden">
                            <img src="${pageContext.request.contextPath}/img/foto5.jpg" alt="Publicidad derecha" class="img-fluid" style="width: 100%; height: 250px; object-fit: cover;">
                            <div class="image-overlay d-flex justify-content-center align-items-center">
                                <a href="#" class="btn btn-light btn-sm">Ver Detalles</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="image-container shadow-sm rounded overflow-hidden">
                            <img src="${pageContext.request.contextPath}/img/foto6.jpg" alt="Publicidad derecha" class="img-fluid" style="width: 100%; height: 250px; object-fit: cover;">
                            <div class="image-overlay d-flex justify-content-center align-items-center">
                                <a href="#" class="btn btn-light btn-sm">Ver Detalles</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="image-container shadow-sm rounded overflow-hidden">
                            <img src="${pageContext.request.contextPath}/img/foto3.jpg" alt="Publicidad derecha" class="img-fluid" style="width: 100%; height: 250px; object-fit: cover;">
                            <div class="image-overlay d-flex justify-content-center align-items-center">
                                <a href="#" class="btn btn-light btn-sm">Ver Detalles</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <a href="#" class="btn btn-primary">Ver más fotos</a>
                </div>
            </section>

            <!-- Nueva Sección de Entrevistas Destacadas -->
            <h3 class="mt-4">Entrevistas Destacadas</h3>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Entrevista Exclusiva con el CEO de TechCorp</h5>
                    <p class="card-text">En esta entrevista exclusiva, el CEO de TechCorp habla sobre el futuro de la tecnología y cómo las empresas pueden adaptarse a la rápida innovación. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non augue eget odio consequat auctor.</p>
                    <a href="#" class="btn btn-primary">Leer más</a>
                </div>
            </div>

            <!-- Sección de Tendencias -->
            <h3 class="mt-4">Tendencias</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/img/foto3.jpg" alt="Publicidad derecha" class="img-fluid" style="width: 100%; height: 250px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Tendencia 1</h5>
                            <p class="card-text">Breve descripción de la tendencia.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/img/foto3.jpg" alt="Publicidad derecha" class="img-fluid" style="width: 100%; height: 250px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Tendencia 2</h5>
                            <p class="card-text">Resumen de otra tendencia popular.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/img/foto3.jpg" alt="Publicidad derecha" class="img-fluid" style="width: 100%; height: 250px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Tendencia 3</h5>
                            <p class="card-text">Resumen de otra tendencia.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Nueva Sección de Entrevistas Destacadas -->
            <h3 class="mt-4">Entrevistas Destacadas</h3>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Entrevista Exclusiva con el CEO de TechCorp</h5>
                    <p class="card-text">En esta entrevista exclusiva, el CEO de TechCorp habla sobre el futuro de la tecnología y cómo las empresas pueden adaptarse a la rápida innovación. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non augue eget odio consequat auctor.</p>
                    <a href="#" class="btn btn-primary">Leer más</a>
                </div>
            </div>

        </div>

        <!-- Barra Lateral con Más Contenido -->
        <div class="col-md-4">
            <!-- Widget de Categorías -->
            <div class="card mb-4">
                <div class="card-header bg-dark text-white">Categorías</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Política</li>
                    <li class="list-group-item">Economía</li>
                    <li class="list-group-item">Salud</li>
                    <li class="list-group-item">Cultura</li>
                    <li class="list-group-item">Tecnología</li>
                </ul>
            </div>

            <!-- Sección de Opinión -->
            <div class="card mb-4">
                <div class="card-header bg-dark text-white">Opinión</div>
                <div class="card-body">
                    <p>Las últimas opiniones sobre temas de interés global, nacional y local.</p>
                    <a href="#" class="btn btn-outline-dark">Ver más</a>
                </div>
            </div>

            <!-- Eventos Próximos -->
            <div class="card mb-4">
                <div class="card-header bg-dark text-white">Eventos Próximos</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Conferencia de Tecnología - 15 de Octubre</li>
                    <li class="list-group-item">Cumbre de Líderes - 22 de Octubre</li>
                    <li class="list-group-item">Seminario de Finanzas - 28 de Octubre</li>
                </ul>
            </div>

            <!-- Más Leídas -->
            <div class="card mb-4">
                <div class="card-header bg-dark text-white">Más Leídas</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Noticia más leída 1</li>
                    <li class="list-group-item">Noticia más leída 2</li>
                    <li class="list-group-item">Noticia más leída 3</li>
                    <li class="list-group-item">Noticia más leída 4</li>
                </ul>
            </div>

            <!-- Más Leídas -->
            <div class="card mb-4">
                <div class="card-header bg-dark text-white">Más Leídas parte 2</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Noticia más leída 1</li>
                    <li class="list-group-item">Noticia más leída 2</li>
                    <li class="list-group-item">Noticia más leída 3</li>
                    <li class="list-group-item">Noticia más leída 4</li>
                </ul>
            </div>

            <!-- Redes Sociales -->
            <div class="card mb-4">
                <div class="card-header bg-dark text-white">Redes Sociales</div>
                <div class="card-body">
                    <a href="#" class="btn btn-primary btn-block mb-2">Facebook</a>
                    <a href="#" class="btn btn-info btn-block mb-2">Twitter</a>
                    <a href="#" class="btn btn-danger btn-block mb-2">YouTube</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer Completo -->
<footer class="bg-dark text-light py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p>Todos los derechos reservados @Vidal Luyo</p>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="#" class="text-light">Política de privacidad</a> | <a href="#" class="text-light">Términos de uso</a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
