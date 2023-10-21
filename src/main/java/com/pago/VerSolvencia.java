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
 * Servlet implementation class VerSolvencia
 */
@WebServlet("/VerSolvencia")
public class VerSolvencia extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usuario = request.getParameter("carnet");
		System.out.println("Solvencia del alumno: " + usuario);
		String Semestre = null;

		try {
			Connmysql conn = new Connmysql();
			ResultSet rsSemestre = conn.SemestrePredomina(usuario);
			if (rsSemestre.next()) {
				Semestre = rsSemestre.getString("semestre");
				System.out.println(Semestre);
				ResultSet rsSolvencia = conn.VerSolvencia(usuario, Semestre);
				if (rsSolvencia.next()) {
					String mes_actual = rsSolvencia.getString("mes_actual");
				    mes_actual = mes_actual.replace(".", "").replaceAll("0*$", "");

					String pagos_realizados = rsSolvencia.getString("pagos_realizados");
					System.out.println(mes_actual);
					System.out.println(pagos_realizados);
					
					if (Integer.parseInt(pagos_realizados) < Integer.parseInt(mes_actual)) {
						int pago_faltante = Integer.parseInt(mes_actual) - Integer.parseInt(pagos_realizados);
						System.out.println("Sin solvencia");
						request.setAttribute("solvencia","No estas solventa, mensualidades faltantes: " + pago_faltante);
					}
					if (Integer.parseInt(mes_actual) == Integer.parseInt(pagos_realizados)) {
						System.out.println("Solvente");
						request.setAttribute("solvencia","Estas Solvente de mensualidades, Asegurate de no tener multas");
					} 
					
					if (Integer.parseInt(mes_actual) < Integer.parseInt(pagos_realizados)) {
						int saldo_favor = Integer.parseInt(pagos_realizados) - Integer.parseInt(mes_actual);
						System.out.println("Saldo a favor");
						request.setAttribute("solvencia",
								"Parece que has pagado mas cuotas, por favor counicate con administracion /r/n"
										+ "Tienes " + saldo_favor + " Cuotas a favor");
					}
					
					System.out.println("Sin registros");
				}
			} else {
				request.setAttribute("SINCURSO", "No se ha asignado sus cursos");
			}
			conn.cerrarConexion();
		} catch (Exception e) {

		}
		request.setAttribute("carnet", usuario);
		request.getRequestDispatcher("Multas.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
