<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PAGO</title>
    <link rel="stylesheet" href="css/pago.css">

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
<h2>${pago}</h2>

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
        <button type="submit" name="verificar" id="verificar">Ver costo</button>
  </form>
  </div>
  
  
  <br>
  <div class="form-card">
   <input name="carnet" id="carnet" type="text" required="required" hidden="true" value="<%=usuario%>">
  <label>Monto a pagar:</label>
  <input id="monto"name="monto" value="${monto}" readonly="readonly" placeholder="Monto a pagar">


    <a href="Visa.jsp?usuario=<%=usuario%>&monto=${monto}&tipo=${tipo}"  target="_blank">Ir a pagar</a>   
  </div>
  

<br><br>
<a href="Menu.jsp" style="color: white">Regresar al menu</a>



</body>
</html>

    