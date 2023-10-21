<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enviar Correo</title>
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

        /* Estilo del menú lateral */
        .sidebar {
            width: 250px;
            background-color: #333;
            color: #fff;
            padding: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .sidebar a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s;
        }

        .sidebar a:hover {
            color: #00bcd4;
        }

        .sidebar img {
            margin-right: 10px;
            width: 24px;
            height: 24px;
        }

        /* Estilos del formulario */
        .content {
            flex: 1;
            padding: 20px;
        }

        .form-container {
            background: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container textarea, .form-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-container button {
            background: #007c91;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</head>
 <%
String usuario = request.getParameter("usuario");

if (usuario == null) {

    usuario = (String) request.getAttribute("carnet");

}
%>
<body>
    <div class="sidebar">
    <%=usuario%>
        <ul>
            <li>
            
                <a href="Menu.jsp">
                    Regresar al menu
                </a>
            </li>
            <!-- Agrega más opciones de menú si es necesario -->
        </ul>
    </div>

    <div class="content">
        <div class="form-container">
        ${exito}
            <h2>Enviar Correo</h2>
            <form action="ServicioAyuda" method="post">
                <label for="asunto">Asunto:</label>
                <input type="text" id="asunto" name="asunto" required>
                <label for="mensaje">Mensaje:</label>
                <textarea id="mensaje" name="mensaje" rows="5" required></textarea>
                <input id="carnet" name="carnet" value="<%=usuario %>" >
                <button type="submit">Enviar Correo</button>
            </form>
        </div>
    </div>
</body>
</html>