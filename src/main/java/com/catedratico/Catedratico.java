package com.catedratico;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Catedratico
 */
@WebServlet("/Catedratico")
public class Catedratico extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrcatedratico = new ArrayList<String>();
		if(request.getParameter("registro") != null ) {
			arrcatedratico .add(request.getParameter("identificacion"));
			arrcatedratico .add(request.getParameter("nombre").toUpperCase());
			arrcatedratico .add(request.getParameter("apellido").toUpperCase());
			arrcatedratico .add(request.getParameter("telefono"));
			arrcatedratico .add(request.getParameter("titulo"));
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
