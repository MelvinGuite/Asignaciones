<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administración de Cursos</title>
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/menulateral.css">
    
 <%
String usuario = request.getParameter("usuario");

if (usuario == null) {

    usuario = (String) request.getAttribute("carnet");

}
%>
</head>
<body>
   <div class="sidebar">
   
        <h2><%=usuario%></h2>
        <a href="Menu.jsp">Menu</a>
  <form action="AdministraCurso">
<input name="usuario" id="usuario" value="<%=usuario%>" hidden="">
<button type="submit" class="leave-button">Cursos Acivos</button>
</form>
   </div>
<div class="content">
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
			
		    
        <div class="card">
            <h2><%=curso%></h2>
            <p>Catedratico: <%=nombre + " " + apellido + " (" + profresion + ")"%></p>
            <p><%=semestre%></p>
            <p class="course-rating">Calificación: <%=valor %></p>
        </div>
        
        

   
			
			
			
	<%	}%>
<%	}%>
<%}%>



 </div>

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
