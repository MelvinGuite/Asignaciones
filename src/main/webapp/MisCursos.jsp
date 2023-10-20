<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administración de Cursos</title>
    
    <style>
        /* Estilos generales */
       body {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	position: relative;
	/* Necesario para el posicionamiento absoluto de ::before */
	background-color: #f5f5f5; /* Fondo suave */
	background-image: url('fondo.jpg'); /* URL de la imagen de fondo */
	background-size: cover;
	/* Ajustar la imagen de fondo para cubrir todo el elemento body */
	background-position: center; /* Centrar la imagen de fondo */
	background-repeat: no-repeat;
	/* Evitar la repetición de la imagen de fondo */
}

        /* Estilo del menú lateral */
        .sidebar {
            width: 250px;
            background: rgba(51, 51, 51, 0.7);
            color: #fff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .sidebar a {
            text-decoration: none;
            color: #fff;
            margin: 10px 0;
        }

        /* Contenedor de las tarjetas */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        /* Estilos de las tarjetas con efecto transparente */
        .card {
            width: 300px;
            background: rgba(255, 255, 255, 0.9); /* Fondo transparente */
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Estilo del botón de "Dejar Curso" */
        .leave-button {
            background-color: #ff0000;
            color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }

        /* Estilo para mostrar la calificación */
        .course-rating {
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
    
 <%
String usuario = request.getParameter("usuario");

if (usuario == null) {

    usuario = (String) request.getAttribute("carnet");
    if(usuario == null ) {
    	response.sendRedirect("index.jsp");
    }
}
%>
</head>
<body>
    <div class="sidebar">
        <h2><%=usuario%></h2>
        <a href="#">Inicio</a>
        <a href="#" onclick="filterBySemester('Semestre 1')">Semestre 1</a>
        <a href="#" onclick="filterBySemester('Semestre 2')">Semestre 2</a>
  <form action="AdministraCurso">
<input name="usuario" id="usuario" value="<%=usuario%>" hidden="">
<button type="submit">Cursos Acivos</button>
</form>
    </div>

<%
Object objCurso = request.getAttribute("cursos");
List<String> lsCurso = null;
if(objCurso != null ) {
	if (objCurso instanceof List) {
		lsCurso = (List<String>) objCurso;
		
		for (int i=0;i<lsCurso.size();i+= 8) {
			String semestre = lsCurso.get(i);
			String direccion = lsCurso.get(i + 1);
			String id_curso = lsCurso.get(i + 2);
			String curso = lsCurso.get(i + 3);
			String nombre = lsCurso.get(i + 4);
			String apellido = lsCurso.get(i + 5);
			String profresion = lsCurso.get(i + 6);
			String valor = lsCurso.get(i + 7);
			if(valor == null ) {
				valor = "sin nota";
			}
			%>
			
		    <div class="card-container">
        <div class="card">
            <h2><%=curso%></h2>
            <p>Catedratico: <%=nombre + " " + apellido + " (" + profresion + ")"%></p>
            <p><%=semestre%></p>
            <p class="course-rating">Calificación: <%=valor %></p>
<button class="leave-button" onclick="dejarcurso('<%=id_curso%>')">Dejar Curso</button>
        </div>

    </div>
			
			
			
	<%	}%>
<%	}%>
<%}%>





    <script>
        function dejarcurso(curso) {
            // Implementa la lógica para dejar un curso aquí
            // En este ejemplo, mostramos una alerta
            alert(' ha dejado el curso ' + curso);
        }

        function filterBySemester(semester) {
            // Implementa la lógica para filtrar cursos por semestre aquí
            // En este ejemplo, simplemente mostramos una alerta
            alert('Mostrando cursos del semestre: ' + semester);
        }

        function mostrarcursoactivo(usuario) {
            // URL del servlet que deseas llamar, incluyendo el parámetro usuario
            var servletURL = "AdministraCurso?usuario=" + usuario; 

            // Realiza una solicitud GET al servlet utilizando la API fetch
            fetch(servletURL)
                .then(function(response) {
                    if (response.status !== 200) {
                        console.log('Hubo un problema. Código de estado: ' + response.status);
                    }
                })
                .catch(function(error) {
                    console.log('Hubo un error en la solicitud:', error);
                });
        }
    </script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// enlace para cerrar sesion
    $(document).ready(function() {
        $("#cerrar-sesion").click(function() {
            // Realizar una solicitud POST al servlet de cierre de sesión
            $.post("AdministraCurso?usuario=<%=usuario%>", function() {

            });
        });
    });
</script>
</body>
</html>
