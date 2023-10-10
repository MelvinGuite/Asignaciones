<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Error</title>
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

        /* Estilo del menú lateral */
        .sidebar {
            width: 250px;
            background-color: rgba(95, 8, 11, 0.4); /* Fondo con transparencia */
            color: #fff;
            padding: 20px;
        }

        /* Estilos de las tarjetas adaptados */
        .card {
            width: calc(33.33% - 20px);
            background: rgba(95, 8, 11, 0.4); /* Fondo con transparencia */
            color: #fff;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            transform: translateY(0);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Capa de desenfoque */
        body::before {
            content: "";
            background-image: url('fondo.jpg');
            filter: blur(100px);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            opacity: 10;
        }

        /* Estilo del botón */
        .button-transparent {
            background-color: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <!-- Contenido de la página de error -->
    <div class="sidebar">
        <h1>Error 404</h1>
        <p>La página que estás buscando no se encontró.</p>
        <a href="index.jsp" class="button-transparent">Volver al Inicio</a>
    </div>
</body>
</html>
