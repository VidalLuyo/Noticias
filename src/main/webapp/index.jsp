<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colegio San José - Educación de Excelencia</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- AOS CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #1a5f7a;
            --secondary-color: #2c3e50;
            --accent-color: #e67e22;
        }

        /* Navbar Styles */
        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .navbar-brand img {
            height: 60px;
        }

        /* Hero Section */
        .hero-section {
            height: 80vh;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
            url('https://th.bing.com/th/id/R.1733ab26e945d8f02fef6babff35f7af?rik=niesB4Edrzj85g&pid=ImgRaw&r=0');
            background-size: cover;
            background-position: center;
            color: white;
            position: relative;
        }

        /* News Cards */
        .news-card {
            transition: transform 0.3s;
            margin-bottom: 20px;
        }

        .news-card:hover {
            transform: translateY(-5px);
        }

        .news-card img {
            height: 200px;
            object-fit: cover;
        }

        /* Features Section */
        .feature-box {
            padding: 30px;
            text-align: center;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        .feature-box:hover {
            transform: translateY(-10px);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        /* Statistics Section */
        .stats-section {
            background: var(--primary-color);
            color: white;
            padding: 60px 0;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
        }

        /* Events Calendar */
        .event-item {
            padding: 15px;
            border-left: 4px solid var(--accent-color);
            margin-bottom: 15px;
            background: white;
            transition: all 0.3s;
        }

        .event-item:hover {
            transform: translateX(10px);
        }

        /* Footer */
        footer {
            background: var(--secondary-color);
            color: white;
            padding: 60px 0 30px;
        }

        /* Custom Animations */
        .fade-up {
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.5s;
        }

        .fade-up.active {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="https://colegiosparroquiales.com/wp-content/uploads/2021/01/003-san-jose.jpg" alt="Logo Colegio San José">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#inicio">Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="#noticias">Noticias</a></li>
                <li class="nav-item"><a class="nav-link" href="#nosotros">Nosotros</a></li>
                <li class="nav-item"><a class="nav-link" href="#admision">Admisión</a></li>
                <li class="nav-item"><a class="nav-link" href="#eventos">Eventos</a></li>
                <li class="nav-item"><a class="nav-link" href="#contacto">Contacto</a></li>
                <li class="nav-item"><a class="nav-link btn btn-primary text-white ms-2" href="login.jsp">Portal</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section d-flex align-items-center" id="inicio">
    <div class="container text-center">
        <h1 class="display-3 mb-4" data-aos="fade-up">Colegio San José</h1>
        <p class="lead mb-4" data-aos="fade-up" data-aos-delay="100">Formando líderes del mañana con valores y excelencia académica</p>
        <a href="#admision" class="btn btn-primary btn-lg me-3" data-aos="fade-up" data-aos-delay="200">
            Proceso de Admisión
        </a>
        <a href="#virtual-tour" class="btn btn-outline-light btn-lg" data-aos="fade-up" data-aos-delay="300">
            Tour Virtual
        </a>
    </div>
</section>

<!-- News Section -->
<section class="py-5" id="noticias">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">Últimas Noticias</h2>
        <div class="row">
            <!-- Noticia Principal -->
            <div class="col-md-8 mb-4">
                <div class="card news-card h-100" data-aos="fade-up">
                    <img src="https://scontent-lim1-1.xx.fbcdn.net/v/t1.6435-9/67446088_158926741917214_934674429382754304_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHbgQombgJuC8iLMImPjkjMYKu82N0XMeJgq7zY3Rcx4uCOp6Dq-tz787ugqJ_-y6S_p9zbCG3qaw_ToEZmPX65&_nc_ohc=z7mPdJ17lksQ7kNvgHwrs4a&_nc_ht=scontent-lim1-1.xx&_nc_gid=AmtGMMNwunI88TOQET1px_q&oh=00_AYDCcDqJlypY0B7XejyUDXLiZPy8zQvMHhU7pKBJZws38w&oe=67409265" class="card-img-top" alt="Noticia Principal">
                    <div class="card-body">
                        <span class="badge bg-primary mb-2">Destacado</span>
                        <h3 class="card-title">Estudiantes Ganan Competencia Nacional de Ciencias</h3>
                        <p class="card-text">Nuestros alumnos obtuvieron el primer lugar en la Olimpiada Nacional de Ciencias, demostrando excelencia y dedicación en el campo científico...</p>
                        <a href="#" class="btn btn-outline-primary">Leer más</a>
                    </div>
                </div>
            </div>

            <!-- Noticias Secundarias -->
            <div class="col-md-4">
                <div class="card news-card mb-4" data-aos="fade-up" data-aos-delay="100">
                    <img src="https://scontent-lim1-1.xx.fbcdn.net/v/t1.6435-9/66383261_155556328920922_4352211831301865472_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeE_3kwZjgUqZwbwMM2k88ZjeOAmgSzApod44CaBLMCmh7lALdd6MALJoQ8t6WJ60kHmg_6cfrRU25Ci02ShV6xT&_nc_ohc=6oVOVClpwIwQ7kNvgGGhrDz&_nc_ht=scontent-lim1-1.xx&_nc_gid=AlKHMY0JCznIcElSKBwN2Ev&oh=00_AYCK0YVGUz1DI7y3u3KgyFRX9M4BVkNz6CeuDwcmC1lxpg&oe=6740A08A" class="card-img-top" alt="Noticia 2">
                    <div class="card-body">
                        <span class="badge bg-success mb-2">Deportes</span>
                        <h5 class="card-title">Equipo de Fútbol Clasifica a Semifinales</h5>
                        <p class="card-text small">Una victoria histórica que nos acerca al campeonato...</p>
                        <a href="#" class="btn btn-sm btn-outline-primary">Leer más</a>
                    </div>
                </div>

                <div class="card news-card" data-aos="fade-up" data-aos-delay="200">
                    <img src="https://th.bing.com/th/id/R.b3b10c770d1b06295264480df1da7cdd?rik=KPld6t8Xce61xg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-BRtsn5ico90%2fTjVbBH-dUkI%2fAAAAAAAAAG0%2fEPuKU-e-QxY%2fs1600%2fDSC05442.JPG&ehk=RZCBmJkQK7teRSDFE1EBacg8Ven8XbIFeoPy7lKamcI%3d&risl=&pid=ImgRaw&r=0" class="card-img-top" alt="Noticia 3">
                    <div class="card-body">
                        <span class="badge bg-info mb-2">Arte</span>
                        <h5 class="card-title">Festival de Arte y Cultura 2024</h5>
                        <p class="card-text small">Estudiantes muestran su talento artístico en exposición anual...</p>
                        <a href="#" class="btn btn-sm btn-outline-primary">Leer más</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">¿Por qué elegirnos?</h2>
        <div class="row">
            <div class="col-md-4 mb-4" data-aos="fade-up">
                <div class="feature-box">
                    <i class="fas fa-graduation-cap feature-icon"></i>
                    <h4>Excelencia Académica</h4>
                    <p>Programas educativos de alto nivel con profesores calificados</p>
                </div>
            </div>
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                <div class="feature-box">
                    <i class="fas fa-users feature-icon"></i>
                    <h4>Valores Humanos</h4>
                    <p>Formación integral basada en valores cristianos y éticos</p>
                </div>
            </div>
            <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
                <div class="feature-box">
                    <i class="fas fa-laptop feature-icon"></i>
                    <h4>Tecnología Moderna</h4>
                    <p>Infraestructura tecnológica de última generación</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Statistics Section -->
<section class="stats-section">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-6" data-aos="fade-up">
                <div class="stat-item">
                    <div class="stat-number">45</div>
                    <div>Años de Experiencia</div>
                </div>
            </div>
            <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="100">
                <div class="stat-item">
                    <div class="stat-number">1200+</div>
                    <div>Estudiantes</div>
                </div>
            </div>
            <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="200">
                <div class="stat-item">
                    <div class="stat-number">98%</div>
                    <div>Tasa de Aprobación</div>
                </div>
            </div>
            <div class="col-md-3 col-6" data-aos="fade-up" data-aos-delay="300">
                <div class="stat-item">
                    <div class="stat-number">50+</div>
                    <div>Profesores</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Events Section -->
<section class="py-5" id="eventos">
    <div class="container">
        <h2 class="text-center mb-5" data-aos="fade-up">Próximos Eventos</h2>
        <div class="row">
            <div class="col-md-6" data-aos="fade-up">
                <div class="event-item">
                    <h5><i class="fas fa-calendar-alt me-2"></i> 15 de Noviembre</h5>
                    <h4>Feria de Ciencias 2024</h4>
                    <p>Exhibición de proyectos científicos de nuestros estudiantes.</p>
                </div>
            </div>
            <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                <div class="event-item">
                    <h5><i class="fas fa-calendar-alt me-2"></i> 20 de Noviembre</h5>
                    <h4>Charla para Padres</h4>
                    <p>Orientación sobre el desarrollo académico y emocional.</p>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Breaking News Banner -->
<div class="breaking-news-banner bg-primary text-white py-2 position-relative">
    <div class="container">
        <div class="d-flex align-items-center">
            <span class="badge bg-danger me-3">ÚLTIMO MOMENTO</span>
            <div class="breaking-news-content overflow-hidden">
                <div class="ticker-wrap">
                    <div class="ticker">
                        <span class="me-4">🏆 Nuestros estudiantes ganan la Olimpiada Nacional de Matemáticas</span>
                        <span class="me-4">📚 Apertura de nuevo laboratorio de ciencias</span>
                        <span class="me-4">🎭 Festival de teatro este fin de semana</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Categorías de Noticias -->
<section class="news-categories py-5">
    <div class="container">
        <div class="row mb-4">
            <div class="col-12">
                <ul class="nav nav-pills justify-content-center" id="newsTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#todas">Todas</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#academicas">Académicas</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#deportes">Deportes</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#cultura">Cultura</button>
                    </li>
                </ul>
            </div>
        </div>

        <div class="tab-content" id="newsTabContent">
            <div class="tab-pane fade show active" id="todas">
                <div class="row">
                    <!-- Noticia Grande -->
                    <div class="col-lg-8" data-aos="fade-up">
                        <div class="card news-card mb-4">
                            <img src="https://scontent-lim1-1.xx.fbcdn.net/v/t1.6435-9/65516995_151405436002678_4009100878437941248_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGYye_2LuUiTdusYqTCa7kSsXVi0be-5TWxdWLRt77lNVvwRjKzWzTF2aRpFVsuWuzvhr8a3dxaU-LK_cBqKygA&_nc_ohc=sl--EF7Gu30Q7kNvgEHWIsF&_nc_ht=scontent-lim1-1.xx&_nc_gid=A1JTc-3IOHrot0dCV9Yz_LJ&oh=00_AYAzcOdAhmPNg-e8L5EJAwsv_Gx_EvKs4o1igPPw1kX6Ig&oe=6740A0BE" class="card-img-top" alt="Noticia Principal">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="badge bg-primary">DESTACADO</span>
                                    <small class="text-muted">Hace 2 horas</small>
                                </div>
                                <h3>Estudiantes Desarrollan Proyecto </h3>
                                <p class="card-text">Un grupo de estudiantes de último año ha desarrollado un innovador proyecto de energía solar que podría revolucionar el consumo energético del colegio...</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="#" class="btn btn-outline-primary">Leer más</a>
                                    <div class="social-shares">
                                        <a href="#" class="text-muted me-2"><i class="fas fa-share-alt"></i></a>
                                        <a href="#" class="text-muted me-2"><i class="far fa-bookmark"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Columna de Noticias Laterales -->
                    <div class="col-lg-4">
                        <div class="news-sidebar">
                            <!-- Noticia Lateral 1 -->
                            <div class="card news-card mb-3" data-aos="fade-up" data-aos-delay="100">
                                <div class="row g-0">
                                    <div class="col-4">
                                        <img src="https://4.bp.blogspot.com/-J98FWcwml8g/WLTwzq7IEKI/AAAAAAAABNU/ta-TjoijQ3wVP168V0McGsIU_nMzziqLwCLcB/s1600/IMG_20170224_104214935_HDR.jpg" class="img-fluid h-100 w-100 object-fit-cover" alt="Noticia">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <span class="badge bg-success mb-1">Deportes</span>
                                            <h6 class="card-title">Victoria en el Torneo Interescolar</h6>
                                            <small class="text-muted">Hace 3 horas</small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Noticia Lateral 2 -->
                            <div class="card news-card mb-3" data-aos="fade-up" data-aos-delay="200">
                                <div class="row g-0">
                                    <div class="col-4">
                                        <img src="https://scontent-lim1-1.xx.fbcdn.net/v/t1.6435-9/58383247_135054630971092_594944573558489088_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGC8OdCzJ3J8f0o6omDGG80CFzXkcM9F-4IXNeRwz0X7sqp9ZWaQIGLj-Lke9yMlCo_jVNXoJKMPmQJ7tgJS5jx&_nc_ohc=zrCwDruN3aMQ7kNvgH0RNRQ&_nc_ht=scontent-lim1-1.xx&_nc_gid=AUVXggSJJi9sjbiHvSsrFDs&oh=00_AYAQ3F47fmpwvVfAop374rkgmZoOherCg3CANgH3zIXFuQ&oe=6740A942" class="img-fluid h-100 w-100 object-fit-cover" alt="Noticia">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <span class="badge bg-info mb-1">Arte</span>
                                            <h6 class="card-title">Exposición de Arte Estudiantil</h6>
                                            <small class="text-muted">Hace 5 horas</small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Noticia Lateral 3 -->
                            <div class="card news-card" data-aos="fade-up" data-aos-delay="300">
                                <div class="row g-0">
                                    <div class="col-4">
                                        <img src="https://scontent-lim1-1.xx.fbcdn.net/v/t1.6435-9/57486601_134118537731368_8529582308557062144_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGYLPRlK39_D16yu4mwlVZpsWOpNlr0XIGxY6k2WvRcgdlFM5szeW80Hap8272tMBpqvvzq28k7oYyk_AvkQHVF&_nc_ohc=yui1wegHZHQQ7kNvgH1Zl2F&_nc_ht=scontent-lim1-1.xx&_nc_gid=AOiL0ZQ0PX9cXkeVPdyn-nX&oh=00_AYCOFppsBXZoJ4U9210hvw7mQhI8H-ZLeQ7OK0k62nbQyQ&oe=67409614" class="img-fluid h-100 w-100 object-fit-cover" alt="Noticia">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <span class="badge bg-warning mb-1">Ciencia</span>
                                            <h6 class="card-title">Feria de Ciencias 2024</h6>
                                            <small class="text-muted">Hace 1 día</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Grid de Noticias Adicionales -->
                <div class="row mt-4">
                    <div class="col-12">
                        <h4 class="mb-4">Más Noticias</h4>
                    </div>
                    <!-- Noticia Grid 1 -->
                    <div class="col-md-4 mb-4" data-aos="fade-up">
                        <div class="card news-card h-100">
                            <img src="https://prelaturayauyos.org.pe/wp-content/uploads/2023/05/colegio-mixto-cerro-alegre.jpg" class="card-img-top" alt="Noticia">
                            <div class="card-body">
                                <span class="badge bg-primary mb-2">Académico</span>
                                <h5>Nuevo Programa de noticias de los alumnos</h5>
                                <p class="card-text small">Estudiantes podrán participar para hacer un reporte</p>
                            </div>
                            <div class="card-footer bg-white">
                                <small class="text-muted">Publicado: 22/10/2024</small>
                            </div>
                        </div>
                    </div>

                    <!-- Noticia Grid 2 -->
                    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card news-card h-100">
                            <img src="https://cbr.uy/nueva/images/torneo-mixto-voley-mayo-2023.jpg" class="card-img-top" alt="Noticia">
                            <div class="card-body">
                                <span class="badge bg-success mb-2">Deportes</span>
                                <h5>Equipo de Voleibol a las Finales</h5>
                                <p class="card-text small">Nuestras deportistas clasifican a la final regional...</p>
                            </div>
                            <div class="card-footer bg-white">
                                <small class="text-muted">Publicado: 21/10/2024</small>
                            </div>
                        </div>
                    </div>

                    <!-- Noticia Grid 3 -->
                    <div class="col-md-4 mb-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="card news-card h-100">
                            <img src="https://th.bing.com/th/id/R.fadea986a96fb4d71f3a09283f69191f?rik=aUaLqk9YtFVU9g&riu=http%3a%2f%2fescueladeroboticamisiones.com%2fsites%2fdefault%2ffiles%2finline-images%2fpasted+image+26.jpg&ehk=TEPuJHQsvV1HFP10eG5cP7GTNXo6hu2FiFaBm473ivM%3d&risl=&pid=ImgRaw&r=0" class="card-img-top" alt="Noticia">
                            <div class="card-body">
                                <span class="badge bg-info mb-2">Tecnología</span>
                                <h5>Laboratorio de Robótica Inaugurado</h5>
                                <p class="card-text small">Nueva sala equipada con tecnología de última generación...</p>
                            </div>
                            <div class="card-footer bg-white">
                                <small class="text-muted">Publicado: 20/10/2024</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Newsletter Section -->
<section class="newsletter-section py-5 bg-light">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <h3>Mantente Informado</h3>
                <p>Suscríbete a nuestro boletín de noticias para recibir las últimas actualizaciones</p>
                <form class="d-flex justify-content-center">
                    <input type="email" class="form-control me-2" style="max-width: 300px" placeholder="Tu correo electrónico">
                    <button class="btn btn-primary">Suscribirse</button>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <h5>Contacto</h5>
                <p><i class="fas fa-map-marker-alt me-2"></i> Av. Principal 123, Ciudad</p>
                <p><i class="fas fa-phone me-2"></i> (123) 456-7890</p>
                <p><i class="fas fa-envelope me-2"></i> info@colegiosanjose.edu</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5>Enlaces Rápidos</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">Calendario Académico</a></li>
                    <li><a href="#" class="text-white">Portal Estudiantil</a></li>
                    <li><a href="#" class="text-white">Biblioteca Virtual</a></li>
                    <li><a href="#" class="text-white">Reglamento</a></li>
                </ul>
            </div>
            <div class="col-md-4 mb-4">
                <h5>Síguenos</h5>
                <div class="social-links">
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <div class="newsletter mt-3">
                    <h6>Suscríbete a nuestro boletín</h6>
                    <form class="d-flex">
                        <input type="email" class="form-control me-2" placeholder="Tu correo electrónico">
                        <button class="btn btn-light">Suscribir</button>
                    </form>
                </div>
            </div>
        </div>
        <hr class="mt-4 mb-4 bg-light">
        <div class="text-center">
            <p>&copy; 2024 Colegio San José. Todos los derechos reservados.</p>
        </div>
    </div>
</footer>


<!-- Botón Flotante de WhatsApp -->
<a href="#" class="whatsapp-float">
    <i class="fab fa-whatsapp"></i>
</a>

<!-- Scripts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<script>
    AOS.init({
        duration: 800,
        once: true
    });

    // Ticker Animation
    const ticker = document.querySelector('.ticker');
    if (ticker) {
        ticker.style.animation = 'ticker 20s linear infinite';
    }
</script>

<!-- Estilos adicionales para elementos específicos -->
<style>
    /* Breaking News Ticker */
    .ticker-wrap {
        width: 100%;
        overflow: hidden;
    }

    .ticker {
        display: inline-block;
        white-space: nowrap;
        padding-right: 100%;
    }

    @keyframes ticker {
        0% { transform: translate3d(0, 0, 0); }
        100% { transform: translate3d(-100%, 0, 0); }
    }

    /* WhatsApp Float Button */
    .whatsapp-float {
        position: fixed;
        width: 60px;
        height: 60px;
        bottom: 40px;
        right: 40px;
        background-color: #25d366;
        color: #FFF;
        border-radius: 50px;
        text-align: center;
        font-size: 30px;
        box-shadow: 2px 2px 3px #999;
        z-index: 100;
        display: flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        transition: all 0.3s;
    }

    .whatsapp-float:hover {
        background-color: #128C7E;
        color: #FFF;
        transform: scale(1.1);
    }
</style>
</body>
</html>