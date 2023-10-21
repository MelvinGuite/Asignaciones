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
 * Servlet implementation class Perfil
 */
@WebServlet("/Perfil")
public class Perfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carnet = request.getParameter("carnet");
		ArrayList<String> arrPerfil = new ArrayList<String>();
		if (request.getParameter("ver") != null) {

			try {
				Connmysql conn = new Connmysql();
				ResultSet rsPerfil = conn.Perfil(carnet);
				while (rsPerfil.next()) {
					arrPerfil.add(rsPerfil.getString("carnet_alumno"));
					arrPerfil.add(rsPerfil.getString("identificacion"));
					arrPerfil.add(rsPerfil.getString("nombre"));
					arrPerfil.add(rsPerfil.getString("apellido"));
					arrPerfil.add(rsPerfil.getString("telefono"));
					arrPerfil.add(rsPerfil.getString("creditos"));
					arrPerfil.add(rsPerfil.getString("email"));
					arrPerfil.add(rsPerfil.getString("foto")); // 8 datos
				}
				request.setAttribute("perfil", arrPerfil);
				conn.cerrarConexion();
			} catch (Exception e) {

			}
		}
		
		if(request.getParameter("editar") != null ) {
			ArrayList<String> arrDatos = new ArrayList<String>();
			String foto = (request.getParameter("foto").replace("/view", "/preview"));

			arrDatos.add(request.getParameter("alumno"));
			arrDatos.add(request.getParameter("telefono"));
			arrDatos.add(request.getParameter("correo"));
			arrDatos.add(foto);
			
			try {
				Connmysql conn = new Connmysql();
				conn.ActualizaPerfil(arrDatos);
				request.setAttribute("exito", "Datos Actualizados");
				conn.cerrarConexion();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("carnet", carnet);
		request.getRequestDispatcher("MiPerfil.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
