<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario Estudiante</title>
</head>
<body>
<h1>Registro de Estudiante</h1>

<form action="RegistraAlumno" method="get">
<label>identificacion</label>
<input name="identificacion" id="identificacion" type="number" required="required">
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
<label>credito</label>
<input name="credito" id="credtio" type="number" required="required">
<br><br>
<button type="submit" name="registro" id="registro">Registrar</button>
<button type="button" name="editar" id="editar">Editar</button>
</form>
<br><br>
<br><br>
<a href="index.jsp">Regresar a la página principal</a>
</form>

</body>
</html>