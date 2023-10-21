<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verificación de Solvencia y Historial de Pago</title>
    <style>
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
	color: black;
}

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-weight: bold;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }

        .payment-history {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
    
    <style>
    #tablaBody tr {
        display: none;
    }
</style>
    
     <%
String usuario = request.getParameter("usuario");

if (usuario == null) {

    usuario = (String) request.getAttribute("carnet");
 
}

String solvencia = (String) request.getAttribute("solvencia");

String cursos = (String) request.getAttribute("SINCURSO");
if (cursos == null ) {
	cursos = "Nota: Para verificar multas, debes asignarte cursos";
}
float total = 0;
%>
</head>
<body>

   
    <div class="container">
     <a href="Menu.jsp">Inicio</a>
    <p><%=cursos%></p>
        <h1>Verificación de Solvencia</h1>
        <form action="VerSolvencia" method="get">
            <label for="studentID">Estudiante</label>
            <input type="text" id="carnet" name="carnet" value="<%=usuario%>" readonly="readonly">

            <button type="submit">Verificar Solvencia</button>
            <p>${solvencia}</p>
        </form>
        
        <div class="payment-history" >
        
            <h2>Historial de Pago de Mensualidad</h2>
         <form action="HistorialMensualidad" method="get">
            <input type="text" id="carnet" name="carnet" value="<%=usuario%>" readonly="readonly" hidden="">

            <button type="submit">Ver historial</button>
        </form>
            <table>
            <caption>Tabla de historial</caption>
                <thead>
                    <tr>
                        <th>Fecha de Pago</th>
                        <th>Concepto</th>
                        <th>Monto</th>
                    </tr>
                </thead>
    <tbody id="tablaBody">
					<%
					Object objPagos = request.getAttribute("historial");
					List<String> lsPagos = null;
					if (objPagos != null) {

						if (objPagos instanceof List) {
							lsPagos = (List<String>) objPagos;
						
							for (int i = 0; i < lsPagos.size(); i += 3) {
						String Fecha = lsPagos.get(i);
						String pago = lsPagos.get(i + 1);
						String monto = lsPagos.get(i + 2);
						 total += Float.parseFloat(monto);
					%>
					<tr>
						<td><%=Fecha%></td>
						<td><%=pago%></td>
						<td>Q<%=monto%></td>
					</tr>
					<%
					}
					%>
					<%
					}
					%>
					<%
					}
					%>
				</tbody>
            </table>
            <p>El total es: Q<%=total %></p>
            <div id="pagination">
    <button id="anterior">Pagina Anterior</button>
    <button id="siguiente">Siguiente Pagina</button>
</div>
            
        </div>
    </div>

<script>
    const registrosPorPagina = 10;
    const tablaBody = document.getElementById('tablaBody');
    const botones = document.getElementById('pagination');
    const registros = document.querySelectorAll('#tablaBody tr');
    let paginaActual = 1;

    function mostrarRegistros() {
        const inicio = (paginaActual - 1) * registrosPorPagina;
        const fin = paginaActual * registrosPorPagina;

        registros.forEach((registro, index) => {
            if (index >= inicio && index < fin) {
                registro.style.display = 'table-row';
            } else {
                registro.style.display = 'none';
            }
        });
    }

    function irAPagina(pagina) {
        if (pagina >= 1 && pagina <= Math.ceil(registros.length / registrosPorPagina)) {
            paginaActual = pagina;
            mostrarRegistros();
        }
    }

    botones.addEventListener('click', (event) => {
        if (event.target.id === 'anterior') {
            irAPagina(paginaActual - 1);
        } else if (event.target.id === 'siguiente') {
            irAPagina(paginaActual + 1);
        }
    });

    mostrarRegistros();
</script>

</body>
</html>
