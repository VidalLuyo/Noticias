<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>
<div class="login-popup">
    <div class="login-header">
        <span>¿Deseas comprar o seguir navegando?</span>
        <button class="close-btn">×</button>
    </div>
    <div class="login-content">
        <a href="#" class="register-btn">REGÍSTRATE GRATIS</a>
        <h2>Ingresar</h2>
        <div class="social-login">
            <a href="https://www.google.com" class="google-btn">
                <img src="https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo.png" alt="Google" class="social-icon">Google
            </a>
            <a href="https://www.facebook.com/sanjose.cerroalegre.56" class="facebook-btn">
                <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook" class="social-icon">Facebook
            </a>
        </div>
        <span class="line-with-text">o con tu correo</span>
        <!-- Se agregó el ID al formulario -->
        <form id="loginForm" action="#" method="POST">
            <div class="input-group">
                <label for="email">Correo electrónico</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="submit-btn">Ingresar</button>
        </form>
        <a href="#" class="forgot-password">Olvidé mi contraseña</a>
    </div>
</div>

<!-- SweetAlert JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<!-- Script para validación y redirección -->
<script>
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Evitar el envío por defecto del formulario

        // Obtener los valores ingresados
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        // Validar si los datos coinciden con los valores correctos
        if (email === 'jesusvidallc5@gmail.com' && password === 'admin123') {
            // Mostrar alerta de éxito
            Swal.fire({
                icon: 'success',
                title: 'Inicio de sesión exitoso',
                text: 'Redirigiendo al panel de administrador...',
                showConfirmButton: false,
                timer: 2000
            }).then(() => {
                // Redirigir a la página de administrador
                window.location.href = 'admin.jsp';
            });
        } else {
            // Mostrar alerta de error
            Swal.fire({
                icon: 'error',
                title: 'Credenciales incorrectas',
                text: 'Por favor, verifica tu correo y contraseña.',
            });
        }
    });
</script>
</body>
</html>
