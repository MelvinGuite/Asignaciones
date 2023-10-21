<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil</title>
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

        /* Estilo del contenedor del perfil */
        .profile-container {
            width: 800px;
            background-color: rgba(95, 8, 11, 0.4); /* Fondo con transparencia */
            color: #fff;
            padding: 20px;
            margin: 0 auto; /* Centrar el contenedor horizontalmente */
            margin-top: 50px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Estilo de la foto de perfil */
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden; /* Oculta el contenido que se desborda */
            margin: 0 auto; /* Centrar la foto horizontalmente */
            margin-bottom: 20px;
        }

        /* Estilo del iframe */
/* Estilo del iframe */
.profile-picture iframe {
    width: 100%;
    height: 100%;
    border: none;
    border-radius: 50%;
    pointer-events: none; /* Deshabilita las interacciones del usuario */
}


        /* Estilo del botón para cambiar la contraseña */
        .change-password-button {
            background-color: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
            padding: 10px 20px;
            margin-bottom: 20px;
            cursor: pointer;
        }

        /* Estilo de los enlaces de navegación */
        .nav-links {
            list-style: none;
            padding: 0;
        }

        .nav-links li {
            margin-bottom: 10px;
        }

        .nav-links a {
            text-decoration: none;
            color: #ffffff;
            font-weight: bold;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #00bcd4;
        }
    </style>
    
    <%
    String usuario = request.getParameter("usuario");  
    if(usuario == null ) {
    	response.sendRedirect("index.jsp"); 
    }
    %>
</head>
<body>
    <!-- Contenido de la página de perfil -->
    <div class="profile-container">
        <div class="profile-picture">
            <iframe src="https://drive.google.com/file/d/1WHZYsJHjDbQe37fr_TdPvUsb2bjNo_QH/preview"></iframe>
        </div>
        <h2>Usuario: <%=usuario %></h2>
        <a class="change-password-button" href="CambioPass.jsp?usuario=<%=usuario%>">Cambiar Contraseña</a>

        
        <h3>Mis Opciones</h3>
        <ul class="nav-links">
            <li><a href="MisCursos.jsp?usuario=<%=usuario%>">Mis Cursos</a></li>
            <li><a href="#">Ver mis datos</a></li>
        </ul>
    </div>
    
</body>
</html>

    