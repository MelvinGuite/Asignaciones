<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario de prueba</title>
</head>
<body>
<h1>Registro de Estudiante</h1>

<form action="RegistraAlumno" method="get">
<label>Nombre:</label>
<input name="nombre" id="nombre" required="required">
<br><br>
<label>identificacion</label>
<input name="identificacion" id="identificacion" type="number" required="required">
<br><br>
<label>correo</label>
<input name="correo" id="correo" type="email" required="required">
<br><br>
<button type="submit" name="registro" id="registro">Registrar</button>
<button type="submit" name="otro" id="otro">Segundo</button>
</form>

</body>
</html>