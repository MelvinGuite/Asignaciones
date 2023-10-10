package com.accesos;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.encriptado.Procesamiento;
import com.mysql.Connmysql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class CambioPass
 */
@WebServlet("/CambioPass")
public class CambioPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrDatos = new ArrayList<String>();
		arrDatos.add(request.getParameter("carnet"));
		arrDatos.add(request.getParameter("current-password"));
		arrDatos.add(request.getParameter("new-password"));
		String hash = null;
		try {
			Procesamiento pro = new Procesamiento();
			Connmysql conn = new Connmysql();
			ResultSet rsHash = conn.Verificar(arrDatos);
			if(rsHash.next()) {
				hash = rsHash.getString("pass");
				System.out.println(hash);
				if(pro.Verificar(arrDatos.get(1), hash)) {
					System.out.println("Proceda a cambiar la contrase");
					String NuevoHash = pro.Encriptar(arrDatos.get(2));
					System.out.println("Nuevo hash" + NuevoHash);
					conn.CambioPass(arrDatos.get(0), NuevoHash);
					System.out.println("Clave cambiada");
					HttpSession session = request.getSession(false);
					if(session != null ) {
						session.invalidate();			
					}
					request.setAttribute("exito", "Actualizado, favor inicia sesion nuevamente");
					request.getRequestDispatcher("index.jsp").forward(request, response);

				} else {
					request.setAttribute("error", "Clave Incorrecta");
					
				}
			}else {
				request.setAttribute("error", "Clave Incorrecta");
				response.sendRedirect("CambioPass.jsp");
			}
			conn.cerrarConexion();
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
















