package com.alumnos;

import java.io.IOException;
import java.util.ArrayList;

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
		ArrayList<String> arrDatos = new ArrayList<String>();
		
		if(request.getParameter("registro") != null ) {
			
			arrDatos.add(request.getParameter("nombre"));
			arrDatos.add(request.getParameter("identificacion"));
			arrDatos.add(request.getParameter("correo"));

			for(String st : arrDatos ) {
				System.out.println(st);
			}
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
