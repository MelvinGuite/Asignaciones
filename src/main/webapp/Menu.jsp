<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sistema de Administración de Cursos</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/menulateral.css">

<!-- Estilos de las tarjetas adaptados -->
<!-- Estilos generales -->
<style>

</style>

    <link rel="stylesheet" href="loader.css">
    <script src="carga.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%-- Recuperar el valor de "pagina" de la sesión --%>
    <% HttpSession sssion = request.getSession(false); // Obtener la sesión sin crear una nueva %>
    <% String usuario = null; %>
    <% if (sssion != null) { %>
        <% usuario = (String) sssion.getAttribute("inicio"); %>
    <% } %>
    
    <%
    if (usuario == null) {
    	response.sendRedirect("index.jsp");
    }
    %>

<script src="https://kit.fontawesome.com/be42ec504e.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Menú Lateral --> 
	<div class="sidebar">
		<img src="logo.jpg" alt="UMG">
		<!-- Agrega una imagen como logo -->
		<ul>
		<li><%=usuario %> </li>
<li><a href="MiPerfil.jsp?usuario=<%=usuario%>"> <i class="fa-solid fa-user fa-beat fa-xl" style="color: #a6b7d3;"></i> Mi perfil</a></li>
			<li>
			<form action="Logout" method="post">
			<button type="submit" class="button-transparent" > <i class="fa-solid fa-right-to-bracket fa-2xl" style="color: #fafcff;"></i>    Cerrar Sesion</button>
			</form>
			</li>
		</ul>
	</div>
	

	<!-- Contenido de las tarjetas -->
	<div class="content">
		<!-- Tarjeta 1: Administrar Estudiantes -->
		
		<div class="card"
			onclick="window.location.href='Multas.jsp?usuario=<%=usuario%>';">
			<i class="fa-solid fa-money-bill-1-wave fa-beat-fade fa-2xl"
				style="color: #d3dbe9;"></i>
			<h2>Solvencia</h2>
			<p>Verifica si estas solvente</p>
		</div>

		<!-- Tarjeta 2: Administrar Cursos -->
		<div class="card"
			onclick="window.location.href='MisCursos.jsp?usuario=<%=usuario%>';">
			<i class="fa-regular fa-address-book fa-beat fa-2xl"
				style="color: #d8dce4;"></i>
			<h2>Administrar Cursos</h2>
			<p>Ver mis cursos</p>
		</div>

		<!-- Tarjeta 3: Asignar Cursos -->
		<div class="card"
			onclick="window.location.href='Asignacion.jsp?usuario=<%=usuario%>';">
			
			<h2>Asignar Cursos</h2>
			<p>Asigna tus cursos.</p>
		</div>

		

		<!-- Tarjeta 5: Configuración -->
		<div class="card" onclick="window.location.href='Pago.jsp?usuario=<%=usuario%>';">
			<h2>Realizar Pagos</h2>
			<p>Realiza tus pagos aqui</p>
		</div>

		<!-- Tarjeta 6: Ayuda y Soporte -->
		<div class="card" onclick="window.location.href='ayuda_soporte.html';">
			
			<h2>Ayuda y Soporte</h2>
			<p>Obtenga ayuda y soporte técnico.</p>
		</div>
	</div>
</body>
</html>
