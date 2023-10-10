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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> arrAcceso = new ArrayList<String>();
		arrAcceso.add(request.getParameter("carnet").toUpperCase());
		arrAcceso.add(request.getParameter("pass"));
		String hash = null;
		try {
			Procesamiento pro = new Procesamiento();
			Connmysql conn = new Connmysql();
			ResultSet rsAcceso = conn.Verificar(arrAcceso);
			if(rsAcceso.next()) {
				hash = rsAcceso.getString("pass");
				System.out.println("El hash es: " + hash);
				if ( pro.Verificar( arrAcceso.get(1), hash)) {

		            // Obtener la sesión actual o crear una nueva si no existe
		            HttpSession session = request.getSession(true);

		            // Establecer una variable de sesión con la página
		            session.setAttribute("inicio", arrAcceso.get(0));
		            System.out.println("Acceso correcto");
		            response.sendRedirect("Menu.jsp");
		        
				}else {
			//		request.getRequestDispatcher("index.jsp").forward(request, response);
					
					System.out.println("Acceso Incorrecto");
				}
			} else {
				System.out.println("Dato no existe");
			}
			conn.cerrarConexion();
		} 
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
		for(String st : arrAcceso) {
			System.out.println(st);
		}
		request.setAttribute("error", "Credenciales Incorrectas");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
