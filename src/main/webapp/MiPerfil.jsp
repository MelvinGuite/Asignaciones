<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil</title>
    <!-- Incluye los estilos CSS que has definido -->
    <style>
        /* Estilos generales */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            position: relative;
            background-color: #f5f5f5;
            background-image: url('fondo.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        /* Estilo del contenedor del perfil */
        .profile-container {
            width: 800px;
            background-color: rgba(95, 8, 11, 0.4); /* Fondo con transparencia */
            color: #fff;
            padding: 20px;
            margin: 0 auto; /* Centrar el contenedor horizontalmente */
            margin-top: 50px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Estilo de la foto de perfil */
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden; /* Oculta el contenido que se desborda */
            margin: 0 auto; /* Centrar la foto horizontalmente */
            margin-bottom: 20px;
        }

        /* Estilo del iframe */
/* Estilo del iframe */
.profile-picture iframe {
    width: 100%;
    height: 100%;
    border: none;
    border-radius: 50%;
    pointer-events: none; /* Deshabilita las interacciones del usuario */
}


        /* Estilo del botón para cambiar la contraseña */
        .change-password-button {
            background-color: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
            padding: 10px 20px;
            margin-bottom: 20px;
            cursor: pointer;
        }

        /* Estilo de los enlaces de navegación */
        .nav-links {
            list-style: none;
            padding: 0;
        }

        .nav-links li {
            margin-bottom: 10px;
        }

        .nav-links a {
            text-decoration: none;
            color: #ffffff;
            font-weight: bold;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #00bcd4;
        }
            table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table, th, td {
        border: 1px solid #fff;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    input[type="text"] {
        width: 100%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    
    /* Estilo del contenedor de la tabla */
.table-container {
    max-height: 400px; /* Ajusta el valor según tu preferencia */
    overflow-y: auto; /* Agrega una barra de desplazamiento vertical si es necesario */
    border: 1px solid #fff; /* Añade un borde al contenedor para mayor claridad */
}
    /* Estilo de los input dentro de la tabla */
.table-container input[type="text"] {
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

/* Estilo de los input de solo lectura (readonly) */
.table-container input[readonly] {
    background-color: #f5f5f5; /* Cambia el color de fondo para los campos de solo lectura */
    color: #333; /* Cambia el color del texto para los campos de solo lectura */
    border: none; /* Elimina el borde en los campos de solo lectura */
}
    </style>
    
    <%
    String usuario = request.getParameter("usuario");  
    if(usuario == null ) {
    	usuario = (String) request.getAttribute("carnet");
    	if( usuario == null)  {
    		response.sendRedirect("index.jsp"); 
    	}
    	
    }
    %>
</head>
<body>
    <!-- Contenido de la página de perfil -->
    <div class="profile-container">
        <div class="profile-picture">
            <iframe src="https://drive.google.com/file/d/1WHZYsJHjDbQe37fr_TdPvUsb2bjNo_QH/preview"></iframe>
        </div>
        <h2>${exito}</h2>
        <h2>Carnet: <%=usuario %></h2>
        <a class="change-password-button" href="CambioPass.jsp?usuario=<%=usuario%>">Cambiar Contraseña</a>

        
        <h3>Mis Opciones</h3>
        <form action="Perfil" method="get">
        <input id="carnet" name="carnet" value="<%=usuario%>" hidden="">
         <a href="Menu.jsp" class="change-password-button">Regresar al Menu</a>
        <ul class="nav-links">
            <li><a href="MisCursos.jsp?usuario=<%=usuario%>" class="change-password-button">Mis Cursos</a></li>
            <li><button id="ver" name="ver" class="change-password-button" type="submit">Ver mis datos</button></li>
        </ul>
        </form>
        
<%
Object objPerfil = request.getAttribute("perfil");
List<String> lsPerfil = null ;

if(objPerfil != null ) {
	if (objPerfil instanceof List) {
		lsPerfil = (List<String>) objPerfil;
		%>
		<form action="Perfil" method="get">
		<div class="table-container">
		        <table border="1">
        <tr>
            <th>Carnet</th>
            <th>Identificación</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Teléfono</th>
            <th>Créditos</th>
            <th>Email</th>
            <th>Foto</th>
        </tr>
		<%
		for(int i=0; i<lsPerfil.size(); i += 8) {
			String carnet = lsPerfil.get(i);
			String identificacion = lsPerfil.get(i + 1);
			String nombre = lsPerfil.get(i + 2);
			String apellido = lsPerfil.get(i + 3);
			String telefono = lsPerfil.get(i + 4);
			String creditos = lsPerfil.get(i + 5);
			String correo = lsPerfil.get(i + 6);
			String foto = lsPerfil.get(i + 7);
			if(foto == null) {
				foto = "Sin foto";
			}
			%>

			<tr>
		<td><input id="alumno" name="alumno" value="<%= carnet %>" readonly="readonly"></td>
        <td><input id="identificacion" name="identificacion" value="<%= identificacion %>" readonly="readonly"></td>
        <td><input id="nombre" name="nombre" value="<%= nombre %>" readonly="readonly"></td>
        <td><input id="apellido" name="apellido" value="<%= apellido %>" readonly="readonly"></td>
        <td><input id="telefono" name="telefono" value="<%= telefono %>"></td>
        <td><input id="creditos" name="creditos" value="<%= creditos %>" readonly="readonly"></td>
        <td><input id="correo" name="correo" value="<%= correo %>"></td>
        <td><input id="foto" name="foto" value="<%= foto %>"></td>
			</tr>
			<%	}%>
<%	}%>
    </table>
    </div>
    <button type="submit" name="editar" id="editar" class="change-password-button">Guardar cambios</button>
    </form>
<%}%>




    </div>
    
</body>
</html>

    