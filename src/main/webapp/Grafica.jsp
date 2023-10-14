<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arquitectura Hexagonal en un Restaurante</title>
    <link rel="stylesheet" href="styles.css">
<style type="text/css">
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.hexagon {
    width: 300px;
    height: 500px;
    position: relative;
    background-color: #f0f0f0;
    clip-path: polygon(50% 0%, 100% 25%, 100% 75%, 50% 100%, 0% 75%, 0% 25%);
}

.core {
    position: absolute;
    top: 40%; /* Ajusta la posición del núcleo para centrarlo mejor */
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #3498db;
    padding: 30px;
    border-radius: 10px;
    color: white;
    z-index: 1; /* Hace que el núcleo esté por encima de los puertos y adaptadores */
}

.port {
    position: absolute;
    width: 80px; /* Aumenta el tamaño de los puertos */
    height: 30px;
    background-color: #e74c3c;
    border-radius: 5px;
    color: white;
}

.port:nth-child(1) {
    top: 30%;
    left: 10%;
}

.port:nth-child(2) {
    top: 50%;
    left: 5%;
}

.port:nth-child(3) {
    top: 70%;
    left: 10%;
}

/* Adaptadores representados como círculos */
.adapter {
    position: absolute;
    width: 40px; /* Tamaño de adaptadores */
    height: 40px;
    background-color: #27ae60; /* Color de adaptadores */
    border-radius: 50%; /* Forma de círculo */
    color: white;
    text-align: center;
    line-height: 40px;
}

.adapter:nth-child(1) {
    top: 10%;
    right: 10%;
}

.adapter:nth-child(2) {
    bottom: 10%;
    right: 10%;
}

</style>
</head>
<body>
    <div class="hexagon">
        <div class="core">
            Cocina
        </div>
        <div class="port">
            Interfaz de Pedidos
        </div>
        <div class="port">
            Interfaz de Proveedores
        </div>
        <div class="port">
            Interfaz de Reservas
        </div>
    </div>
</body>
</html>

