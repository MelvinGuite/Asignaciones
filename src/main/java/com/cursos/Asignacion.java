package com.cursos;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Asignacion
 */
@WebServlet("/Asignacion")
public class Asignacion extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String carnet = request.getParameter("carnet");
		String[] cursosSeleccionados = request.getParameterValues("cursosSeleccionados");
		String salon = request.getParameter("salon");
		String ciclo = request.getParameter("ciclo");
		try {
			Connmysql conn = new Connmysql();
			if (cursosSeleccionados != null) {
			    for (String curso : cursosSeleccionados) {
			        // Procesa cada curso seleccionado
			        System.out.println("Curso seleccionado: " + curso + " " + carnet + " " + salon + " " + ciclo);
			        conn.Asignacion(carnet, curso, salon, ciclo);
			    }    
			}
			System.out.println("Cursos asignados");
			conn.cerrarConexion();
			request.setAttribute("asignacion", "Tus cursos han sido asignados");
		} catch (SQLException e) {

		if(e.getSQLState().equals("45000")) {
			request.setAttribute("error", "Alguno de los curso seleccionados ya estan asignados");
		} else {
			e.printStackTrace();
		}

	}
		request.setAttribute("carnet", carnet);
		request.getRequestDispatcher("Asignacion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
