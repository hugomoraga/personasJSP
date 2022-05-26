package cl.talentodigital;

import java.sql.*;


public class ConexionDB {
    public static Connection ConexionDB(){
    	Connection conn = null;
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    	    conn = DriverManager.getConnection("jdbc:mysql://localhost/personas?" +
    	                                   "user=root&password=password");

    	} catch (SQLException ex) {
    		System.out.println("SQLException: " + ex.getMessage());
    	    System.out.println("SQLState: " + ex.getSQLState());
    	    System.out.println("VendorError: " + ex.getErrorCode());
    	} catch (ClassNotFoundException ex) {
    	    System.out.println("Class not Found " + ex);
    	}
	    return conn;	
    }
    
   
}
