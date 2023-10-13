<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario de Asignación</title>
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
<%
String usuario = request.getParameter("usuario");

if (usuario == null) {

    usuario = (String) request.getAttribute("carnet");
}
%>
<body>
<h2>${usuario}</h2>

<h1 style="color: white;">Asignación de Cursos</h1> <!-- Cambia el color del título a blanco -->

<div class="form-card">
  <form action="Curso" method="get">
    <label>Carnet Alumno</label>
    <input name="carnet" id="carnet" type="text" value="<%=usuario%>" readonly="readonly">
        <br><br>
     <label>Selecciona el Semestre</label>
    <select name="semestre" id="semestre">
    <option value="Primer Semestre">Primer Semestre</option>
    <option value="Segundo Semestre">Segundo Semestre</option>
    <option value="Tercer Semestre">Tercer Semestre</option>
    <option value="Cuarto Semestre">Cuarto Semestre</option>
    </select>
    <br><br>	
        <button type="submit" name="ver" id="ver">Ver curso disponibles</button> 
  </form>
</div>
<br><br>

<h2>${exito}</h2>
<h2>${asignacion}</h2>
<h2>${error}</h2>
<h2>${limite}</h2>
	<div class="form-card">
<form action="Asignacion" method="get">
	<%
	Object objCurso = request.getAttribute("cursos");
	List<String> lsCurso = null;

	if (objCurso != null) {
		if (objCurso instanceof List) {
			lsCurso = (List<String>) objCurso;
			%>
			
			<%
		for (int i = 0; i < lsCurso.size(); i += 6) {
		String Curso = lsCurso.get(i);
		String id = lsCurso.get(i + 1);
		String direccion = lsCurso.get(i + 2);
		String nivel = lsCurso.get(i + 3);
		String id_salon = lsCurso.get(i + 4);
		String ciclo = lsCurso.get(i + 5);
	%>
	
    <input type="checkbox" id="<%=id %>" name="cursosSeleccionados" value="<%=id%>">
    <label for="curso"><%=Curso%></label><br>
    <label>Salon</label> <br>
    <label>Direccion: <%=direccion %></label> <br>
    <label>Nivel: <%=nivel%></label>
    <input name="salon" id="salon" value="<%=id_salon%>" hidden="true">
    <input name="ciclo" id="ciclo" value="<%=ciclo%>" hidden="true">
    <br><br>

	<%
	}
	%>

	<%
	}
	%>
	<%
	}else{ %>
		<p>No hay datos </p>
		<%}
	%>
	<input type="text" name="carnet" id="carnet" value="<%=usuario%>">
    <button type="submit" name="registro" id="registro">Asignar</button>
</form>
</div>
<br><br>
<br><br>






<a href="Menu.jsp" style="color: white;">Regresar al menu</a>
</body>
</html>