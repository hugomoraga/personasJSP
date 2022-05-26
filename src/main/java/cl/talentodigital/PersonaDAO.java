package cl.talentodigital;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CRUD {
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	Statement stmt;
	List<Persona> datos = listar();

	
	@Override
	public List<Persona> listar() {
		List<Persona> datos = new ArrayList<>();
		String sqlQuery = "select * from personas";
		try {
			con = ConexionDB.ConexionDB();
			ps=con.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				Persona p = new Persona();
				p.setId(rs.getInt("id"));
				p.setNombre(rs.getString("nombre"));
				p.setApellido(rs.getString("apellido"));
				p.setEdad(rs.getInt("edad"));
				datos.add(p);
			}
			
			
		} catch (Exception e) {
		}
		return datos;

	}



	@Override
	public String agregarPersona(Persona persona) {
		String mensaje = null;
		String nombre = persona.getNombre();
		String apellido = persona.getApellido();
		int edad = persona.getEdad();
		String sqlQuery = "insert into personas(nombre, apellido, edad)values('" + nombre + "','" + apellido + "','" +  edad + "')";
		try {
			con = ConexionDB.ConexionDB();
			ps = con.prepareStatement(sqlQuery);
			ps.executeUpdate();
			mensaje = "Success";
		      con.close();
		
			
		} catch (Exception e) {
			mensaje = e.toString();
		}
		return mensaje;
	} 
	
	
	@Override
	public String actualizarPersona(Persona persona) {
		String mensaje = null;

		String sqlQuery = "UPDATE personas "
				+ "SET nombre='" + persona.getNombre() 
				+ "', apellido = '" + persona.getApellido()
				+ "', edad = '" + persona.getEdad()
				+ "' WHERE id = " + persona.getId() ;
		System.out.println(sqlQuery);
		try {
			con = ConexionDB.ConexionDB();
			ps = con.prepareStatement(sqlQuery);
			ps.executeUpdate();
			mensaje = "Success";
			System.out.println(mensaje);
		      con.close();
		
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return mensaje;
	}



	@Override
	public String eliminarPersona(int id) {
		String mensaje = null;
		int deleteId = id;
	    String query = "delete from personas where id = ?";		
	    try {
			con = ConexionDB.ConexionDB();
			ps = con.prepareStatement(query);
			ps.setInt(1, deleteId);
			ps.execute();
			mensaje = "Delete";
		    con.close();
		
			
		} catch (Exception e) {
			mensaje = e.toString();
		}
		return mensaje;
	  
	}



	@Override
	public Persona obtenerPersona(int id) {
		Persona persona = new Persona();
		String mensaje = null;
	    String sqlQuery = "SELECT id,nombre,apellido,edad "
	    		+ "FROM personas where id=" + id + "";		
	    try {
	    	con = ConexionDB.ConexionDB();
			ps=con.prepareStatement(sqlQuery);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				persona.setId(rs.getInt("id"));
				persona.setNombre(rs.getString("nombre"));
				persona.setApellido(rs.getString("apellido"));
				persona.setEdad(rs.getInt("edad"));
			}
		
			
		} catch (Exception e) {
			mensaje = e.toString();
		}
		return persona;
	 
		
	}
	
	

	
}