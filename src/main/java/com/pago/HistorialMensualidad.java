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
 * Servlet implementation class HistorialMensualidad
 */
@WebServlet("/HistorialMensualidad")
public class HistorialMensualidad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("carnet");
		ArrayList<String> arrPagos = new ArrayList<String>();
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsPagos = conn.Historial(usuario);
			while(rsPagos.next()) {
				arrPagos.add(rsPagos.getString("fecha"));
				arrPagos.add(rsPagos.getString("tipo_pago"));
				arrPagos.add(rsPagos.getString("monto"));
			}
			conn.cerrarConexion();
		} catch (Exception e) {
		e.printStackTrace();
		}
		request.setAttribute("historial", arrPagos);
		request.setAttribute("carnet", usuario);
		request.getRequestDispatcher("Multas.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
