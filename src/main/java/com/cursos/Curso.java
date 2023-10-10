package com.cursos;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Curso
 */
@WebServlet("/Curso")
public class Curso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String carnet = request.getParameter("carnet");
		String ciclo = request.getParameter("semestre");
		ArrayList<String> arrCurso = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsCurso = conn.Cursos(carnet, ciclo);
			while(rsCurso.next()) {
				arrCurso.add(rsCurso.getString("nombre_curso"));
				arrCurso.add(rsCurso.getString("id_curso"));
				arrCurso.add(rsCurso.getString("direccion"));
				arrCurso.add(rsCurso.getString("nivel"));
				arrCurso.add(rsCurso.getString("id_salon"));
				arrCurso.add((rsCurso.getString("ciclo")));
			}
			conn.cerrarConexion();
			request.setAttribute("carnet", carnet);
			request.setAttribute("cursos",arrCurso);
			request.setAttribute("exito", "Cursos dispoibles");
		}catch (Exception e) {
			e.printStackTrace();
		}
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
