<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de Contrase�a</title>
    <!-- Incluye los estilos CSS que has definido -->
    <style>
        /* Estilos generales */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            position: relative;
            background-color: #f5f5f5;
            background-image: url('fondo.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        /* Estilo del formulario */
        .change-password-form {
            width: 300px;
            background-color: rgba(95, 8, 11, 0.4); /* Fondo con transparencia */
            color: #fff;
            padding: 20px;
            margin: 0 auto; /* Centrar el formulario horizontalmente */
            margin-top: 50px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Estilo de los campos del formulario */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #fff;
            border-radius: 5px;
            background-color: transparent;
            color: #fff;
        }

        /* Estilo del bot�n */
        .button-transparent {
            background-color: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
            padding: 10px 20px;
            cursor: pointer;
        }

        /* Estilo para mostrar un mensaje de error */
        .error-message {
            color: #ff0000;
        }

        /* Estilo para el bot�n de alternancia de mostrar/ocultar contrase�a */
        .toggle-password-button {
            background-color: transparent;
            border: none;
            color: #ffffff;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <%
    String usuario = request.getParameter("usuario");  
    if(usuario == null ) {
    	response.sendRedirect("index.jsp"); 
    }
    %>
    <h2>${error}</h2>
    <h2>${exito}</h2>
    <!-- Contenido del formulario de cambio de contrase�a -->
    <div class="change-password-form">
        <h2>Cambio de Contrase�a</h2>
        <form action="CambioPass" method="post" onsubmit="return validateForm()">
          <input type="text" id="carnet" name="carnet" value="<%=usuario%>" hidden="true">
        
            <div class="form-group">
                <label for="current-password">Contrase�a Actual</label>
                <input type="password" id="current-password" name="current-password" required>
            </div>
            <div class="form-group">
                <label for="new-password">Nueva Contrase�a</label>
                <input type="password" id="new-password" name="new-password" required>
                <button type="button" class="toggle-password-button" onclick="togglePassword('new-password')">Mostrar</button>
            </div>
            <div class="form-group">
                <label for="confirm-new-password">Confirmar Nueva Contrase�a</label>
                <input type="password" id="confirm-new-password" name="confirm-new-password" required>
                <button type="button" class="toggle-password-button" onclick="togglePassword('confirm-new-password')">Mostrar</button>
                <p class="error-message" id="password-error"></p>
            </div>
            <button type="submit" class="button-transparent">Cambiar Contrase�a</button>
        </form>
    </div>

    <!-- JavaScript para la validaci�n del formulario y mostrar/ocultar contrase�as -->
    <script>
        function validateForm() {
            var currentPassword = document.getElementById("current-password").value;
            var newPassword = document.getElementById("new-password").value;
            var confirmNewPassword = document.getElementById("confirm-new-password").value;
            var passwordError = document.getElementById("password-error");

            // Verificar si la contrase�a actual es diferente de la nueva contrase�a
            if (currentPassword === newPassword) {
                passwordError.textContent = "La nueva contrase�a debe ser diferente de la contrase�a actual.";
                return false; // Evita enviar el formulario
            }

            // Verificar si las contrase�as nuevas coinciden
            if (newPassword !== confirmNewPassword) {
                passwordError.textContent = "Las contrase�as nuevas no coinciden.";
                return false; // Evita enviar el formulario
            }

            // Si todas las verificaciones son exitosas, el formulario se enviar�
            return true;
        }

        function togglePassword(inputId) {
            var passwordInput = document.getElementById(inputId);
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }
    </script>
</body>
</html>
