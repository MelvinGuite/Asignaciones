package com.pago;

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
 * Servlet implementation class ProcesarPago
 */
@WebServlet("/ProcesarPago")
public class ProcesarPago extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrPago = new ArrayList<String>();
		arrPago.add(request.getParameter("monto"));
		arrPago.add(request.getParameter("carnet"));
		arrPago.add(request.getParameter("tipo"));
		String semestrePre = null;
		if(arrPago.get(2).equals("Mensualidad")) {
			try {
				Connmysql conn = new Connmysql();
				ResultSet rsSemestre = conn.SemestrePredomina(arrPago.get(1));
				if(rsSemestre.next()) {
					semestrePre = rsSemestre.getString("semestre");
					conn.ProcesarPago(arrPago, semestrePre);
					conn.cerrarConexion();
					request.setAttribute("pago" ,"Su pago fue recibido con exito");
					String cerrarVenta = "<script>window.close();</script>";
					response.getWriter().write(cerrarVenta);
				} else {
					request.setAttribute("SINCURSO", "No se ha asignado sus cursos");
				}
			} catch (Exception e) {
				request.setAttribute("pago" ,"Su pago no ha podido ser procesado");
				e.printStackTrace();
			}
		}
		request.setAttribute("carnet", arrPago.get(1));
		request.getRequestDispatcher("Pago.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
