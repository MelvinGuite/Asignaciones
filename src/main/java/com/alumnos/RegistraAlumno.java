package com.alumnos;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.emailservice.ServicioCorreo;
import com.encriptado.Procesamiento;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistraAlumno
 */
@WebServlet("/RegistraAlumno")
public class RegistraAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrAlumno = new ArrayList<String>();
		if(request.getParameter("registro") != null ) {
			arrAlumno.add(request.getParameter("identificacion"));
			arrAlumno.add(request.getParameter("nombre").toUpperCase());
			arrAlumno.add(request.getParameter("apellido").toUpperCase());
			arrAlumno.add(request.getParameter("telefono"));
			arrAlumno.add(request.getParameter("email"));
			for(String st : arrAlumno) {
				System.out.println(st);
			}
			try {
				String carnet = null;
				Connmysql conn = new Connmysql();
				ResultSet rsCarnet = conn.RegistraAlumno(arrAlumno);
				while(rsCarnet.next()) {
				 carnet = rsCarnet.getString("carnet_alumno");
				}	
				Procesamiento encriptar = new Procesamiento();
				String hash = encriptar.Encriptar(carnet);
				System.out.println(hash);
				conn.Credencial(hash, carnet);
				conn.cerrarConexion();
				ServicioCorreo envio = new ServicioCorreo();
				envio.EnviaCorreo(arrAlumno.get(4),arrAlumno.get(1) ,arrAlumno.get(2), carnet );
				request.setAttribute("exito", "Alumno registrado con exito \n\n" + 
				"Se ha enviado correo de confirmacion");
				System.out.println("Nuevo alumno registrado");
			} catch (SQLException e) {
				if(e.getSQLState().equals("45000")) {
					request.setAttribute("existe", "Ya existe un alumno con el numero de identificacion proporcionado");
				} else {
					e.printStackTrace();
				}
			}
			
		}
		request.getRequestDispatcher("Alumno.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
