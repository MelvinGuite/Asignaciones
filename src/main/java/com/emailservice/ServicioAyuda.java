package com.emailservice;

import java.io.IOException;
import java.sql.ResultSet;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ServicioAyuda
 */
@WebServlet("/ServicioAyuda")
public class ServicioAyuda extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String carnet = request.getParameter("carnet");
		String motivo = request.getParameter("asunto");
		String mensaje = request.getParameter("mensaje");
		String correo = null;
		String nombre = null;
		String apellido = null;
		try {
			Connmysql conn = new Connmysql();
			ResultSet rsDatos = conn.ObtenerCorreo(carnet);
			if(rsDatos.next()) {
				correo = rsDatos.getString("email");
				nombre = rsDatos.getString("nombre");
				apellido = rsDatos.getString("apellido");
			}
			conn.cerrarConexion();
			Soporte sp = new Soporte();
			sp.EnviaCorreo(motivo, mensaje, correo, carnet, nombre, apellido);
			request.setAttribute("exito", "Su correo ha sido enviado con exito");
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("carnet", carnet);
		request.getRequestDispatcher("Ayuda.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
