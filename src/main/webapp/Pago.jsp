<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PAGO</title>
<style>
/* Estilos generales */
body {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
	background-color: #f5f5f5;
	background-image: url('fondo.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	color: #fff;
}

/* Estilo del título */
h1 {
	color: white;
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

/* Estilo para el elemento select */
.form-card select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 20px;
	background-color: white;
	color: black;
}

</style>
</head>
<%
String usuario = request.getParameter("usuario");

if (usuario == null) {

    usuario = (String) request.getAttribute("carnet");
}

String monto = (String) request.getAttribute("monto");
%>
<body>
<h2>${usuario}</h2>
<h2>${SINCURSO}</h2>
<h2>${vacio}</h2>
<h2>${total}</h2>


<h2><%=usuario%></h2>

<h1>Registro de Pago</h1>

<div class="form-card">
  <form action="PagoSemestre" method="get">
    <label>Carnet Alumno</label>
    <input name="carnet" id="carnet" type="text" required="required" readonly="readonly" value="<%=usuario%>">
    <br><br>
    <label>Tipo de Pago</label>
    <select name="tipo" id="tipo">
      <option value="">Selecciona una opción</option>
      <option value="Inscripcion">Inscripcion</option>
      <option value="Asignacion">Asignacion</option>
      <option value="Mensualidad">Colegiatura</option>
      <option value="Certificado">Certificado</option>
      <option value="Carne">Carné</option>   
      <option value="Multa">Multa</option> 
    </select>

  <label>Monto a pagar:</label>
  <input id="monto"name="monto" value="${monto}" readonly="readonly" placeholder="Monto a pagar">
    <button type="submit" name="verificar" id="verificar">Ver costo</button> <br> <br>
    <button type="submit" name="pagar" id="pagar">Realizar pago</button>
    
  </form>
  

</div>
<br><br>
<br><br>
<a href="Menu.jsp" style="color: white">Regresar al menu</a>



</body>
</html>

    