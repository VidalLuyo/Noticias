<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% TituloDTO titulo = null; %>
<%@ page import="pe.edu.vallegrande.model.TituloDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="pe.edu.vallegrande.controller.TituloController" %>
<%@ page import="pe.edu.vallegrande.model.ContenidoDTO" %>
<%@ page import="pe.edu.vallegrande.controller.ContenidoController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pe.edu.vallegrande.controller.DocenteController" %>
<%@ page import="pe.edu.vallegrande.controller.AlbumController" %>
<%@ page import="pe.edu.vallegrande.controller.MasNoticiasController" %>
<%@ page import="pe.edu.vallegrande.model.MasNoticiasDTO" %>
<%@ page import="pe.edu.vallegrande.model.AlbumDTO" %>
<%@ page import="pe.edu.vallegrande.model.DocenteDTO" %>
<%
    // Crear una instancia del controlador de Docentes y obtener la lista de docentes
    DocenteController docenteController = new DocenteController();
    List<DocenteDTO> docentes = docenteController.listarTodos();


%>

<%
    // Instancia del controlador para obtener las noticias de la base de datos
    MasNoticiasController masNoticiasController = new MasNoticiasController();
    List<MasNoticiasDTO> masNoticias = masNoticiasController.listarTodas();

    // Verifica si hay noticias disponibles
    MasNoticiasDTO noticiaPrincipal = masNoticias != null && !masNoticias.isEmpty() ? masNoticias.get(0) : null;
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>noticia</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/videos.css">
    <style>
        /* Principal Card */
        .principal-card {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .main-news-img {
            height: 300px;
            object-fit: cover;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .additional-card {
            background-color: #f1f5ff;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            #noticias h2 {
                font-size: 1.8em;
            }

            .news-card .card-body h3 {
                font-size: 1.3em;
            }

            .news-card .card-body h5 {
                font-size: 1.1em;
            }

            .news-card img, .main-news-img {
                height: auto;
            }
        }

        /* Equipo de Docentes */
        .team-section {
            padding: 2rem 0;
            background-color: #f3f4f6;
            text-align: center;
        }

        .docente-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 8px;
            overflow: hidden;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .docente-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        .docente-img {
            height: 250px;
            object-fit: cover;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }


        /* Álbum de Fotos */
        .photo-album {
            background: #f9fafb;
            padding: 2rem;
        }


        .photo-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 12px;
            transition: transform 0.4s ease;
        }

        .photo-item:hover img {
            transform: scale(1.1);
        }

        /* Modal Lightbox */
        .modal-content {
            background: rgba(0, 0, 0, 0.9);
            border: none;
            padding: 0;
            border-radius: 12px;
        }

        .modal-body {
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal-body .btn-close {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 10;
            background-color: #fff;
            border-radius: 50%;
            padding: 5px;
        }

        #lightboxImage {
            width: 100%;
            max-height: 80vh;
            border-radius: 12px;
        }


        .map-container iframe {
            width: 100%;
            height: 450px;
            border: none;
            border-radius: 8px;
        }

        /* Footer */
        .footer {
            background-color: var(--primary-color);
            color: #ffffff;
            text-align: center;
            padding: 1.5rem;
            font-size: 0.9rem;
        }

        .footer a {
            color: #ffffff;
            margin: 0 10px;
            text-decoration: none;
        }


        .social-icons {
            margin-top: 10px;
        }

        .social-icons a {
            font-size: 1.2rem;
            margin: 0 10px;
            color: #ffffff;
            transition: color 0.3s;
        }


        /* General Styles for News Categories */
        .news-categories {
            background-color: #f8f9fa;
            padding: 60px 0;
        }

        .news-categories h4 {
            font-weight: 700;
            font-size: 1.8em;
            color: #343a40;
            text-align: center;
        }

        .news-card {
            border: none;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .news-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }

        /* Main News Image Style */
        .news-card img {
            height: auto;
            max-height: 300px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .news-card:hover img {
            transform: scale(1.05);
        }

        /* Card Body Styling */
        .news-card .card-body {
            padding: 20px;
            background-color: #fff;
        }

        .news-card .card-body h3,
        .news-card .card-body h5,
        .news-card .card-body h6 {
            font-weight: 600;
            color: #212529;
        }

        .news-card .card-body p {
            color: #6c757d;
        }

        .news-card .badge {
            font-size: 0.9em;
            font-weight: 500;
        }

        /* Card Footer */
        .news-card .card-footer {
            padding: 15px;
            background-color: #f1f1f1;
            text-align: right;
        }

        /* Sidebar News Styles */
        .news-sidebar .card {
            background-color: #f8f9fa;
            border-radius: 8px;
        }

        .news-sidebar .card .card-body {
            padding: 10px 15px;
        }

        .news-sidebar .card .card-title {
            font-size: 1em;
            color: #343a40;
        }

        .news-sidebar .card .badge {
            font-size: 0.8em;
        }

        /* News Grid */
        .news-categories .row .col-md-4 .card {
            height: 100%;
        }

        .news-categories .row .col-md-4 .card-footer {
            display: none; /* Removed "Publicado" text as requested */
        }

        /* Responsive */
        @media (max-width: 768px) {
            .news-card .card-body h3 {
                font-size: 1.2em;
            }
        }

        .secondary-news-img, .additional-card .card-img-top {
            height: 150px; /* Reducción de la altura de las imágenes secundarias */
            object-fit: cover;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }
        -----

    </style>
</head>

<body>

<!-- Barra superior -->
<div class="top-bar">
    <ul>
        <li><a href="#">Últimas Noticias</a></li>
        <li><a href="#">Actualidad</a></li>
        <li><a href="#">Videos</a></li>
        <li><a href="#">Deportes</a></li>
        <li><a href="#">Tecnología</a></li>
        <li><a href="#">Más</a></li>
        <li><a href="#">Sintoniza tu región</a></li>
        <li><a href="#">Podcasts</a></li>
        <!-- Agregar "Iniciar sesión" -->
        <li><a href="${pageContext.request.contextPath}/login.jsp">Iniciar sesión</a></li> <!-- Redirige a la página de inicio de sesión -->
    </ul>
</div>

<!-- Encabezado -->
<header class="header">
    <div class="header-left">
        <!-- Botón de menú -->
        <button class="menu-button" onclick="toggleMenu()">☰ Menú</button>
        <!-- Buscar -->
        <form class="search-form" onsubmit="performSearch(event)">
            <input type="text" id="search-input" placeholder="Buscar...">
            <button type="submit"></button>
        </form>
    </div>
    <div class="header-center">
        <!-- Logo -->
        <div class="logo">
            <div class="circle"></div>
            <span>COLEGIO MIXTO SAN JOSE</span>
        </div>
    </div>

</header>

<!-- Menú lateral -->
<div id="side-menu" class="side-menu">
    <div class="menu-header">
        <button class="close-button" onclick="toggleMenu()">✖</button>
    </div>
    <div class="menu-content">
        <!-- Logo centrado -->
        <div class="menu-logo">
            <div class="circle"></div>
            <span>COLEGIO MIXTO
        SAN JOSE</span>
        </div>

        <!-- Texto centrado de redes sociales -->
        <div class="social-section">
            <p>Síguenos en redes sociales</p>
            <div class="social-icons">
                <a href="#" class="social-icon tiktok">🎵</a>
                <a href="#" class="social-icon instagram">📸</a>
                <a href="#" class="social-icon facebook">📘</a>
                <a href="#" class="social-icon youtube">🎥</a>
            </div>
        </div>

        <!-- Botones de WhatsApp -->
        <button class="whatsapp-button">🟢 Únete a nuestro canal en WhatsApp</button>
        <button class="sports-button">🔵 Únete a nuestro canal de Deportes</button>

        <!-- Secciones con fondo gris solo hasta Fútbol -->
        <div class="sections-box">
            <h3>Secciones</h3>
            <ul class="sections-list">
                <li>Últimas noticias <span class="arrow">›</span></li>
                <li>Política <span class="arrow">›</span></li>
                <li>Lima <span class="arrow">›</span></li>
                <li>Perú <span class="arrow">›</span></li>
                <li>Fútbol <span class="arrow">›</span></li>
            </ul>
        </div>

        <!-- Secciones sin fondo gris -->
        <ul class="sections-list">
            <li>Otras noticias <span class="arrow">›</span></li>
            <li>Internacionales <span class="arrow">›</span></li>
        </ul>
    </div>
</div>


<div class="container">
    <header class="header">
        <h1>Ultimas noticias</h1>
    </header><br>
    <main class="main-content">
        <!-- Noticia destacada -->
        <section class="highlight-news">
            <h2>Dirigente de transportistas exige la renuncia del ministro Juan Santiváñez tras asesinato de chofer de empresa 'El Rápido'</h2>
            <img src="${pageContext.request.contextPath}/Img/Director.png" alt="Noticia principal" class="main-image">
            <p>
                En declaraciones a <strong>RPP</strong>, el vicepresidente de la Alianza Nacional de Transportistas,
                <strong>Julio Campos</strong>, señaló que evalúan realizar un paro nacional el 10, 11 o 12 de diciembre, debido a la creciente ola de criminalidad en el país.
            </p>
        </section>

        <!-- Noticias secundarias -->
        <aside class="side-news">
            <div class="news-item">
                <img src="${pageContext.request.contextPath}/Img/Director.png" alt="Noticia 1">
                <h3>¡Hace historia! Max Verstappen es el campeón del mundo de Fórmula 1 en Las Vegas</h3>
                <p class="author">Esto ocurrio mientras solian ir a tal lugar Esto ocurrio mientras solian ir a tal lugar</p>
            </div>
            <div class="news-item">
                <img src="${pageContext.request.contextPath}/Img/Director.png" alt="Noticia 2">
                <h3>Gustavo Costas y su devoción por el Señor de los Milagros: llevó pin del Cristo Moreno...</h3>
                <p class="author">Esto ocurrio mientras solian ir a tal lugar  Esto ocurrio mientras solian ir a tal lugar</p>
            </div>
        </aside>
    </main>
</div>
<header class="header">
</header>
<!-- News Section -->
<section class="py-5 bg-light" id="noticias">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">Últimas Noticias</h2>

        <%
            ContenidoController contenidoController = new ContenidoController();
            List<ContenidoDTO> contenidos = contenidoController.listarTodos();

            if (contenidos != null && !contenidos.isEmpty()) {
                ContenidoDTO noticiaP = contenidos.get(0);
        %>
        <div class="row">
            <!-- Noticia Principal -->
            <div class="col-lg-6 mb-4">
                <div class="card news-card principal-card shadow-lg border-0" data-aos="fade-up">
                    <img src="<%= noticiaP.getImg() %>" class="card-img-top main-news-img" alt="Noticia Principal">
                    <div class="card-body p-4">
                        <span class="badge bg-primary mb-2">Destacado</span>
                        <h3 class="card-title"><%= noticiaP.getContenido() %></h3>
                        <p class="card-text"><%= noticiaP.getDescripcion() %></p>
                        <a href="#" class="btn btn-sm btn-outline-primary">Leer más</a>
                    </div>
                </div>

                <!-- Tarjeta Adicional debajo de la Noticia Principal -->
                <%
                    if (contenidos.size() > 5) {
                        ContenidoDTO noticiaAdicional = contenidos.get(5);
                %>
                <div class="card news-card shadow-sm mt-4 additional-card border-0" data-aos="fade-up" data-aos-delay="100">
                    <img src="<%= noticiaAdicional.getImg() %>" class="card-img-top secondary-news-img" alt="Noticia Adicional">
                    <div class="card-body p-3">
                        <span class="badge bg-secondary mb-2">Adicional</span>
                        <h5 class="card-title"><%= noticiaAdicional.getContenido() %></h5>
                        <p class="card-text small"><%= noticiaAdicional.getDescripcion() %></p>
                        <a href="#" class="btn btn-sm btn-outline-primary">Leer más</a>
                    </div>
                </div>
                <%
                    }
                %>
            </div>

            <!-- Noticias Secundarias (Máximo 5) -->
            <div class="col-lg-6">
                <div class="row">
                    <%
                        for (int i = 1; i < contenidos.size() && i < 5; i++) {
                            ContenidoDTO noticiaSecundaria = contenidos.get(i);
                            String badgeClass = i % 2 == 0 ? "bg-success" : "bg-info";
                    %>
                    <div class="col-md-6 mb-4">
                        <div class="card news-card shadow-sm secondary-card variant-<%= i %> border-0" data-aos="fade-up" data-aos-delay="<%= i * 100 %>">
                            <img src="<%= noticiaSecundaria.getImg() %>" class="card-img-top secondary-news-img" alt="Noticia <%= i %>">
                            <div class="card-body p-3">
                                <span class="badge <%= badgeClass %> mb-2">Noticia</span>
                                <h5 class="card-title"><%= noticiaSecundaria.getContenido() %></h5>
                                <p class="card-text small"><%= noticiaSecundaria.getDescripcion() %></p>
                                <a href="#" class="btn btn-sm btn-outline-primary">Leer más</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <%
        } else {
        %>
        <p class="text-center">No hay noticias disponibles en la base de datos.</p>
        <%
            }
        %>
    </div>
</section>

<header class="header">
</header>


<!-- Nuestro Equipo de Docentes - Carrusel -->
<section class="team-section py-5">
    <div class="container">
        <!-- Título de la Sección -->
        <div class="text-center mb-5">
            <h2 class="section-title" data-aos="fade-up">Nuestro Equipo de Docentes</h2>
            <p class="section-subtitle text-muted" data-aos="fade-up" data-aos-delay="100">
                Conoce a los profesionales que dedican su experiencia y conocimientos para formar a nuestros estudiantes.
            </p>
        </div>

        <!-- Carrusel de Docentes -->
        <div id="docentesCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
                    if (docentes != null && !docentes.isEmpty()) {
                        int index = 0;
                        for (int i = 0; i < docentes.size(); i += 3) {
                            // Marcar el primer "slide" como "active"
                            String activeClass = index == 0 ? "active" : "";
                %>
                <div class="carousel-item <%= activeClass %>">
                    <div class="row justify-content-center">
                        <%
                            // Mostrar hasta tres docentes por "slide"
                            for (int j = i; j < i + 3 && j < docentes.size(); j++) {
                                DocenteDTO docente = docentes.get(j);
                        %>
                        <div class="col-md-4">
                            <div class="card shadow-sm border-0 h-100 docente-card">
                                <img src="<%= docente.getImg() %>" alt="<%= docente.getNombres() %>" class="card-img-top docente-img">
                                <div class="card-body text-center">
                                    <h5 class="card-title mb-0"><%= docente.getNombres() %></h5>
                                    <p class="card-text text-muted"><%= docente.getDescripcion2() %></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <%
                        index++;
                    }
                } else {
                %>
                <p class="text-center">No hay docentes disponibles en la base de datos.</p>
                <%
                    }
                %>
            </div>

            <!-- Controles del Carrusel -->
            <button class="carousel-control-prev" type="button" data-bs-target="#docentesCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#docentesCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
    </div>
</section>
<header class="header">
</header>
<!-- Álbum de Fotos Section -->
<section class="photo-album py-5 bg-light" id="album">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">Álbum de Fotos</h2>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
            <%
                // Crear una instancia del controlador y obtener la lista de fotos desde la base de datos
                AlbumController albunController = new AlbumController();
                List<AlbumDTO> fotos = albunController.listarTodas();

                // Limitar a 12 imágenes y mostrarlas en el álbum
                for (int i = 0; i < fotos.size() && i < 12; i++) {
                    AlbumDTO foto = fotos.get(i);
            %>
            <div class="col">
                <div class="card shadow-sm border-0 h-100">
                    <a href="<%= foto.getImg() %>" data-bs-toggle="modal" data-bs-target="#lightboxModal" class="lightbox-link">
                        <img src="<%= foto.getImg() %>" alt="Foto del Álbum" class="card-img-top img-fluid" style="height: 200px; object-fit: cover;">
                    </a>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Lightbox Modal -->
    <div class="modal fade" id="lightboxModal" tabindex="-1" aria-labelledby="lightboxModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <img src="" alt="Imagen ampliada" class="img-fluid" id="lightboxImage">
                </div>
            </div>
        </div>
    </div>
</section>

<header class="header">
</header>
<!-- Categorías de Mas Noticias -->
<section class="news-categories py-5">
    <div class="container">
        <div class="tab-content" id="newsTabContent">
            <div class="tab-pane fade show active" id="todas">
                <div class="row">
                    <!-- Noticia Grande (Principal) -->
                    <div class="col-lg-8" data-aos="fade-up">
                        <div class="card news-card mb-4">
                            <% if (noticiaPrincipal != null) { %>
                            <img src="<%= noticiaPrincipal.getImg() %>" class="card-img-top" alt="Noticia Principal">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="badge bg-primary">DESTACADO</span>
                                </div>
                                <h3><%= noticiaPrincipal.getContenido() %></h3>
                                <p class="card-text"><%= noticiaPrincipal.getDescripcion() %></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="#" class="btn btn-outline-primary">Leer más</a>
                                </div>
                            </div>
                            <% } else { %>
                            <p class="text-center">No hay noticias destacadas disponibles.</p>
                            <% } %>
                        </div>
                    </div>

                    <!-- Columna de Noticias Laterales (Secundarias) -->
                    <div class="col-lg-4">
                        <div class="news-sidebar">
                            <%
                                for (int i = 1; i < masNoticias.size() && i < 6 ; i++) {
                                    MasNoticiasDTO noticiaSecundaria = masNoticias.get(i);
                            %>
                            <div class="card news-card mb-3" data-aos="fade-up" data-aos-delay="<%= i * 100 %>">
                                <div class="row g-0">
                                    <div class="col-4">
                                        <img src="<%= noticiaSecundaria.getImg() %>" class="img-fluid h-100 w-100 object-fit-cover" alt="Noticia <%= i %>">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <span class="badge bg-info mb-1">Noticia</span>
                                            <h6 class="card-title"><%= noticiaSecundaria.getContenido() %></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</section>

<header class="header">
</header>
<div class="container">
    <header class="header">
        <h1>Lima</h1>
    </header><br>
    <main class="main-content">
        <!-- Noticia destacada -->
        <section class="highlight-news">
            <h2>Dirigente de transportistas exige la renuncia del ministro Juan Santiváñez tras asesinato de chofer de empresa 'El Rápido'</h2>
            <img src="${pageContext.request.contextPath}/Img/Director.png" alt="Noticia principal" class="main-image">
            <p>
                En declaraciones a <strong>RPP</strong>, el vicepresidente de la Alianza Nacional de Transportistas,
                <strong>Julio Campos</strong>, señaló que evalúan realizar un paro nacional el 10, 11 o 12 de diciembre, debido a la creciente ola de criminalidad en el país.
            </p>
        </section>

        <!-- Noticias secundarias -->
        <aside class="side-news">
            <div class="news-item">
                <img src="${pageContext.request.contextPath}/Img/Director.png" alt="Noticia 1">
                <h3>¡Hace historia! Max Verstappen es el campeón del mundo de Fórmula 1 en Las Vegas</h3>
                <p class="author">por <strong>Katia Choque</strong> · 07:19 hs</p>
            </div>
            <div class="news-item">
                <img src="${pageContext.request.contextPath}/Img/Director.png" alt="Noticia 2">
                <h3>Gustavo Costas y su devoción por el Señor de los Milagros: llevó pin del Cristo Moreno...</h3>
                <p class="author">por <strong>Freddy Chávarry</strong> · 17:00 hs</p>
            </div>
        </aside>
    </main>
    <header class="header">
    </header><br>
</div>


<!-- Footer Fijo -->
<footer class="footer bg-dark text-white py-4">
    <div class="container text-center">
        <p class="mb-1">&copy; 2024 Colegio San José. Todos los derechos reservados.</p>
        <small>Contacto: info@colegiosanjose.com | Teléfono: +51 123 456 789</small>
        <div class="social-icons mt-3">
            <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
            <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</footer>



<!-- AOS Script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init({
        duration: 800,
        once: true
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const lightboxLinks = document.querySelectorAll(".lightbox-link");
        const lightboxImage = document.getElementById("lightboxImage");

        lightboxLinks.forEach(link => {
            link.addEventListener("click", function(event) {
                event.preventDefault();
                const imageUrl = this.getAttribute("href");
                lightboxImage.setAttribute("src", imageUrl);
            });
        });
    });
</script>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/Js/script.js"></script>
</body>
</html>