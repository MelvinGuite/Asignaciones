package com.alumnos;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


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
				conn.cerrarConexion();
				request.setAttribute("exito", "Alumno registrado con exito, su carnet es: " + carnet);
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
