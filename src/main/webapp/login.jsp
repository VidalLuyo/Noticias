<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert CSS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 4rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 600;
        }

        .form-control {
            border-radius: 25px;
        }

        .btn-primary {
            background-color: #007bff;
            border-radius: 25px;
            padding: 0.75rem;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-text {
            text-align: center;
        }

        .forgot-password {
            text-align: right;
        }

        .forgot-password a {
            color: #007bff;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<div class="login-container">
    <h2>Iniciar Sesión</h2>
    <form id="loginForm" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Correo Electrónico</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="forgot-password mb-3">
            <a href="#">¿Olvidaste tu contraseña?</a>
        </div>
        <button type="submit" class="btn btn-primary">Ingresar</button>
        <div class="form-text mt-3">
            ¿No tienes cuenta? <a href="#">Regístrate aquí</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

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
