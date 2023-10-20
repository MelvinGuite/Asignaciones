package com.pago;

import java.io.IOException;
import java.sql.ResultSet;

import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PagoSemestre
 */
@WebServlet("/PagoSemestre")
public class PagoSemestre extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carnet = request.getParameter("carnet");
		String tipo_pago = request.getParameter("tipo");
		String semestre = request.getParameter("semestre");
		String monto = null;
		String semestre_pre = null;
		if (tipo_pago.equals("Mensualidad")) {

			try {
				Connmysql conn = new Connmysql();
				ResultSet rs_semestre = conn.SemestrePredomina(carnet);
				if (rs_semestre.next()) {
					semestre_pre = rs_semestre.getString("semestre");
					System.out.println("el semestre predominante es: " + semestre_pre);
					ResultSet rs_monto = conn.ValorMensualidad(semestre_pre);
					if (rs_monto.next()) {
						monto = rs_monto.getString("monto_mora");
						request.setAttribute("monto", monto);
						System.out.println("El monto a pagar es : " + monto);
					} else {
						request.setAttribute("error", "No se encontro registro de pago");
					}
				} else {
					request.setAttribute("SINCURSO", "No se ha asignado sus cursos");
				}
				conn.cerrarConexion();
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (tipo_pago.equals("Inscripcion")) {
			
			try {
				Connmysql conn = new Connmysql();
				ResultSet rs_monto = conn.PagosCostoFijo(tipo_pago);
				if(rs_monto.next()) {
					monto = rs_monto.getString("monto");
					request.setAttribute("monto", monto);
					conn.cerrarConexion();
				} else {
					System.out.println("No se encontraron datos para inscripcion");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		} else if (tipo_pago.equals("Asignacion")) {
			try {
				Connmysql conn = new Connmysql();
				ResultSet rs_monto = conn.PagosCostoFijo(tipo_pago);
				if(rs_monto.next()) {
					monto = rs_monto.getString("monto");
					request.setAttribute("monto", monto);
					conn.cerrarConexion();
				} else {
					System.out.println("No se encontraron datos par asignacion");
				}
			} catch (Exception e ) {
				e.printStackTrace();
			}
			
		} else if (tipo_pago.equals("Certificado")) {
			try {
				Connmysql conn = new Connmysql();
				ResultSet rs_monto = conn.PagosCostoFijo(tipo_pago);
				if(rs_monto.next()) {
					monto = rs_monto.getString("monto");
					request.setAttribute("monto", monto);
					conn.cerrarConexion();
				} else {
					System.out.println("No se encontraron datos para certificado");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (tipo_pago.equals("Carne")) {
			try {
				Connmysql conn = new Connmysql();
				ResultSet rs_monto = conn.PagosCostoFijo(tipo_pago);
				if(rs_monto.next()) {
					monto = rs_monto.getString("monto");
					request.setAttribute("monto", monto);
					conn.cerrarConexion();
				} else {
					System.out.println("No se encontraron datos para Carne");
				}
			} catch (Exception e ) {
				e.printStackTrace();
			}
		} else if (tipo_pago.equals("Multa")) {
			try {
				Connmysql conn = new Connmysql();
				ResultSet rs_monto = conn.CostoMultas(carnet, tipo_pago);
				if(rs_monto.next()) {
					monto = rs_monto.getString("monto");
					if(monto == null) {
						monto = "0";
						request.setAttribute("vacio", "No tienes multas");
					}
					request.setAttribute("monto", monto);
					request.setAttribute("total", "Se muestra el costo total de multas acumuladas");
					conn.cerrarConexion();
				} else {
					request.setAttribute("vacio", "No tienes multas");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("El tipo de pago es: " + tipo_pago);
		request.setAttribute("tipo", tipo_pago);
		request.setAttribute("carnet", carnet);
		request.getRequestDispatcher("Pago.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
