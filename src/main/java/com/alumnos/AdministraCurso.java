package com.alumnos;

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
 * Servlet implementation class AdministraCurso
 */
@WebServlet("/AdministraCurso")
public class AdministraCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String usuario = request.getParameter("usuario");
	    System.out.println(usuario);
	    
	    ArrayList<String> arrCursos = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsCursos = conn.CursoActivo(usuario);
			while(rsCursos.next()) {
				arrCursos.add(rsCursos.getString("semestre"));
				arrCursos.add(rsCursos.getString("direccion"));
				arrCursos.add(rsCursos.getString("id_curso"));
				arrCursos.add(rsCursos.getString("curso"));
				arrCursos.add(rsCursos.getString("nombre"));
				arrCursos.add(rsCursos.getString("apellido"));
				arrCursos.add(rsCursos.getString("titulo"));
				arrCursos.add(rsCursos.getString("valor"));
			}
			request.setAttribute("cursos", arrCursos);
			System.out.println("mostrando curso del alumno");
			conn.cerrarConexion();
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("carnet", usuario);
		request.getRequestDispatcher("MisCursos.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
