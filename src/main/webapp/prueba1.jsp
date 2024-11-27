<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pe.edu.vallegrande.controller.MasNoticiasController" %>
<%@ page import="pe.edu.vallegrande.model.MasNoticiasDTO" %>
<%@ page import="java.util.List" %>
<%
  // Crear una instancia del controlador para obtener la noticia aleatoria
  MasNoticiasController masNoticiasController = new MasNoticiasController();
  MasNoticiasDTO noticiaAleatoria = masNoticiasController.obtenerNoticiaAleatoria();
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/actualizar.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
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

<main>
  <div class="main-content">
    <!-- Noticia Principal -->
    <!-- Sección de la noticia aleatoria -->
    <section class="main-article">
      <div class="image-container">
        <img src="<%= noticiaAleatoria != null ? noticiaAleatoria.getImg() : "https://via.placeholder.com/800x400" %>" alt="Noticia Aleatoria">
        <div class="theme"><%= noticiaAleatoria != null ? noticiaAleatoria.getDescripcion() : "Descripción de la noticia" %></div>
      </div>
      <div class="article-text">
        <h1><%= noticiaAleatoria != null ? noticiaAleatoria.getContenido() : "Título de la noticia" %></h1>
        <p class="content">
          <%= noticiaAleatoria != null ? noticiaAleatoria.getContenido() : "Contenido de la noticia." %>
        </p>
      </div>
    </section>

    <!-- Noticias Laterales y Recomendaciones -->
    <aside class="sidebar">
      <!-- Lo más leído -->
      <section class="most-read">
        <h2>Lo más leído</h2>
        <div class="news-item">
          <img src="https://via.placeholder.com/120x120" alt="Noticia más leída">
          <p><a href="#">Corte Suprema volvió a rechazar pedido de general Lozada para ser excluido de...</a></p>
        </div>
        <div class="news-item">
          <img src="https://via.placeholder.com/120x120" alt="Noticia más leída">
          <p><a href="#">Falleció José Luis Lecaros, expresidente de la Corte Suprema de Justicia</a></p>
        </div>
        <div class="news-item">
          <img src="https://via.placeholder.com/120x120" alt="Noticia más leída">
          <p><a href="#">Eduardo Salhuana reconoce errores en aprobación de leyes: "No somos perfectos, somos..."</a></p>
        </div>
      </section>

      <!-- Te recomendamos -->
      <section class="recommendations">
        <h2>Te recomendamos</h2>
        <div class="recommendation-item">
          <img src="https://via.placeholder.com/120x120" alt="Recomendación">
          <p><a href="#">Piura: padres denuncian hallazgo de conserva de Qali Warma presuntamente en mal estado</a></p>
        </div>
        <div class="recommendation-item">
          <img src="https://via.placeholder.com/120x120" alt="Recomendación">
          <p><a href="#">Ministro Julio Demartini dice que proceso judicial contra Nicanor Boluarte está siendo politizado</a></p>
        </div>
      </section>
    </aside>
  </div>
</main>

<!-- Contenedor de contenido -->
<div class="container">
  <header class="header">
    <h2>Actualidad</h2>
  </header>

  <!-- Noticia Principal -->
  <section class="news">
    <div class="news-image">
      <img src="<%= noticiaAleatoria != null ? noticiaAleatoria.getImg() : "https://via.placeholder.com/800x400" %>" alt="Noticia relevante">
    </div>
    <div class="news-content">
      <h3><%= noticiaAleatoria != null ? noticiaAleatoria.getDescripcion() : "Título de la noticia" %></h3>
      <p><%= noticiaAleatoria != null ? noticiaAleatoria.getContenido() : "Contenido de la noticia" %></p>
      <button class="listen-button">Escuchar · 22:23</button>
    </div>
  </section>


  <!-- Descripción de Noticias -->
  <section class="news-section">
    <div class="news-row">
      <!-- Recorrer las noticias y listarlas -->
      <%
        List<MasNoticiasDTO> listaNoticias = masNoticiasController.listarTodas();
        int count = 0; // Inicializar contador
        for (MasNoticiasDTO noticia : listaNoticias) {
          if (count == 3) break; // Solo mostrar las 3 primeras noticias
          count++; // Incrementar contador
      %>
      <div class="news-card">
        <img src="<%= noticia.getImg() != null ? noticia.getImg() : "https://via.placeholder.com/300x200" %>" alt="<%= noticia.getDescripcion() %>">
        <div class="news-details">
          <p class="category">General</p>
          <h3><%= noticia.getDescripcion() %></h3>
        </div>
      </div>
      <% } %>
    </div>
  </section>

</div>


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
