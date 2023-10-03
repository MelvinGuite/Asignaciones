<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Administración de Cursos</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <style>
        /* Estilos generales */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background-color: #f5f5f5; /* Fondo suave */
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

        /* Estilos de las tarjetas */
        .content {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        /* Estilos de las tarjetas adaptados */
        .card {
            width: calc(33.33% - 20px);
            background: linear-gradient(to bottom right, #00bcd4, #007c91); /* Gradiente suave */
            color: #fff; /* Letras blancas */
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
            transform: translateY(-5px); /* Efecto de flotar */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card h2 {
            font-size: 18px;
            margin-top: 10px;
        }

        /* Imágenes de las tarjetas */
        .card img {
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <!-- Menú Lateral -->
    <div class="sidebar">
        <ul>
          <li>
              <a href="#">
                  <img src="ayuda.png">
                  Mi perfil
              </a>
          </li>
            <li>
                <a href="#">
                    <img src="configuracion.png" alt="Configuración">
                    Configuración
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="ayuda.png">
                    Ayuda y Soporte
                </a>
            </li>
            <li>
                <a href="#">
                    <img src="ayuda.png">
                    Cerrar Sesion
                </a>
            </li>
        </ul>
    </div>

    <!-- Contenido de las tarjetas -->
    <div class="content">
        <!-- Tarjeta 1: Administrar Estudiantes -->
        <div class="card" onclick="window.location.href='administrar_estudiantes.html';">
            <img src="estudiantes.png" alt="Estudiantes">
            <h2>Administrar Estudiantes</h2>
            <p>Gestione la información de los estudiantes.</p>
        </div>

        <!-- Tarjeta 2: Administrar Cursos -->
        <div class="card" onclick="window.location.href='administrar_cursos.html';">
            <img src="cursos.png" alt="Cursos">
            <h2>Administrar Cursos</h2>
            <p>Gestione los cursos disponibles.</p>
        </div>

        <!-- Tarjeta 3: Asignar Cursos -->
        <div class="card" onclick="window.location.href='asignar_cursos.html';">
            <img src="asignar.png" alt="Asignar Cursos">
            <h2>Asignar Cursos</h2>
            <p>Asigne cursos a los estudiantes.</p>
        </div>

        <!-- Tarjeta 4: Informes y Estadísticas -->
        <div class="card" onclick="window.location.href='informes_estadisticas.html';">
            <img src="informes.png" alt="Informes y Estadísticas">
            <h2>Informes y Estadísticas</h2>
            <p>Acceda a informes y estadísticas.</p>
        </div>

        <!-- Tarjeta 5: Configuración -->
        <div class="card" onclick="window.location.href='configuracion.html';">
            <img src="configuracion.png" alt="Configuración">
            <h2>Configuración</h2>
            <p>Personalice la configuración del sistema.</p>
        </div>

        <!-- Tarjeta 6: Ayuda y Soporte -->
        <div class="card" onclick="window.location.href='ayuda_soporte.html';">
            <img src="ayuda.png" alt="Ayuda y Soporte">
            <h2>Ayuda y Soporte</h2>
            <p>Obtenga ayuda y soporte técnico.</p>
        </div>
    </div>
</body>
</html>
