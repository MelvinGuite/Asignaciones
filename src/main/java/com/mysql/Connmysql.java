package com.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oracle.wls.shaded.org.apache.regexp.recompile;

public class Connmysql {
	private String url = "jdbc:mysql://database-1.clrghkrtdl1q.us-east-2.rds.amazonaws.com:3306/ProyectoQA";
	private String usuario = "admin";
	private String password = "1829372MG";
	private Connection conexion = null;

	// ___________________________Conexion a la base de   datos_____________________________________//
	public Connmysql() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url, usuario, password);
			// System.out.println("Conexión establecida");
		} catch (ClassNotFoundException e) {
			System.out.println("Error al cargar el driver");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Error en la conexión");
			e.printStackTrace();
		}
	}

	public void cerrarConexion() {
		try {
			conexion.close();
			// System.out.println("Conexión cerrada");
		} catch (SQLException e) {
			System.out.println("Error al cerrar la conexión");
			e.printStackTrace();
		}
	}
	
	
	//Reigstra alumno y devuelve su carnet 
	public ResultSet RegistraAlumno (ArrayList<String> datos ) throws SQLException{		
		CallableStatement cl = conexion.prepareCall(" {  CALL RegistraAlumno(?, ?, ?, ?, ?) }");
		cl.setInt(1, Integer.parseInt(datos.get(0)));
		cl.setString(2, datos.get(1));
		cl.setString(3, datos.get(2));
		cl.setInt(4, Integer.parseInt(datos.get(3)));
		cl.setString(5, datos.get(4));
		cl.execute();
		
		String consulta = "SELECT carnet_alumno from alumno a where identificacion = ? ; " ;
		PreparedStatement ps = conexion.prepareStatement(consulta);
		ps.setInt(1, Integer.parseInt(datos.get(0)));
		return ps.executeQuery();
	}
	
	//Encritado
	public void Credencial (String pass, String carnet) throws SQLException {
		CallableStatement cl = conexion.prepareCall("{ call CreaCredencial (?, ? ) }");
		cl.setString(1, pass);
		cl.setString(2, carnet);
		cl.execute();
	}
	
	//Verificacion de hash
	public ResultSet Verificar (ArrayList<String>  arrDato) throws SQLException {
		String consulta = "select pass from credencial WHERE carnet_alumno = ? ;";
		PreparedStatement ps = conexion.prepareStatement(consulta);
		ps.setString(1, arrDato.get(0));
		return ps.executeQuery();
	}
	
	//cambio de pass 
	public void CambioPass (String carnet, String hash) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" { call CambioPass ( ?, ? ) } ");
		cl.setString(1, carnet);
		cl.setString(2, hash);
		cl.execute();
	}
	
	//ver cursos disponibles para asignar
	public ResultSet Cursos (String carnet, String ciclo ) throws SQLException {
		String consulta = ("   SELECT c.nombre AS nombre_curso, c.id AS id_curso, s.id_salon, s.direccion, s.nivel, c.ciclo  \r\n"
				+ "FROM curso AS c\r\n"
				+ "JOIN salon AS s ON c.id_salon = s.id_salon\r\n"
				+ "WHERE c.ciclo = ? \r\n"
				+ "AND (c.requisito IS NULL OR c.requisito = '' OR c.requisito IN (\r\n"
				+ "    SELECT c2.nombre\r\n"
				+ "    FROM curso AS c2\r\n"
				+ "    JOIN nota AS n ON c2.id_curso = n.id_curso\r\n"
				+ "    WHERE n.carnet_alumno = ? \r\n"
				+ "        AND n.valor >= 61\r\n"
				+ "));");
		
		PreparedStatement ps = conexion.prepareStatement(consulta);
		ps.setString(1, ciclo);
		ps.setString(2, carnet);
		return ps.executeQuery();
	}
	
	//Asignacion de curso 
	public void Asignacion (String carnet, String curso, String salon, String ciclo ) throws SQLException {
		CallableStatement cl = conexion.prepareCall(" { call Asignacion (?, ?, ?, ? ) }");
		cl.setString(1, ciclo);
		cl.setString(2, carnet);
		cl.setInt(3, Integer.parseInt(curso));
		cl.setInt(4, Integer.parseInt(salon));
		cl.execute();
	}

}





























