<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario Estudiante</title>
<style>
/* Estilos generales */
body {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column; /* Cambia la dirección de flex a columna */
	align-items: center; /* Centra verticalmente el contenido */
	justify-content: center; /* Centra horizontalmente el contenido */
	position: relative;
	background-color: #f5f5f5;
	background-image: url('fondo.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	color: #fff; /* Cambia el color del texto a blanco */
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
	background: linear-gradient(to bottom right, #00bcd4, #007c91);
	color: #007c91;
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

/* Estilos para el formulario */
.form-card {
	background-color: rgba(255, 255, 255, 0.9);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	max-width: 400px;
	color: black;
}

</style> 
</head>
<body>
<h1 style="color: white;">Registro de Estudiante</h1> <!-- Cambia el color del título a blanco -->
<h1>${existe}</h1>
<div class="form-card">
  <form action="RegistraAlumno" method="post">
    <label>Identificacion</label>
    <input name="identificacion" id="identificacion" type="number" required="required" placeholder="Ingrese todos los digitos de su DPI">
    <br><br>
    <label>Nombre:</label>
    <input name="nombre" id="nombre" required="required">
    <br><br>
    <label>apellido</label>
    <input name="apellido" id="apellido" required="required">
    <br><br>
    <label>telefono</label>
    <input name="telefono" id="telefono" type="number" required="required">
    <br><br>
    <label>Correo Electronico</label>
    <input name="email" id="email" type="email" required="required">
    <br><br>

    <button type="submit" name="registro" id="registro">Registrar</button>
    <button type="button" name="editar" id="editar">Editar</button>
  </form>
</div>
<br><br>
<br><br>
<h1>${exito}</h1>
<a href="Menu.jsp" style="color: white;">Regresar a la página principal</a>
</body>
</html>
