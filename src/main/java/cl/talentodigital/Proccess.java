package cl.talentodigital;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Proccess
 */
@WebServlet("/Proccess")
public class Proccess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Proccess() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// Obtiene el parametro de accion desde la lista //
		String accion = request.getParameter("accion");
		
		PersonaDAO personadao = new PersonaDAO();
		Persona p = new Persona();
		
		
		
		String nombrePersona = request.getParameter("nombreForm");
    	String apellidoPersona = request.getParameter("apellidoForm");
    	int edadPersona = 0;
    	if (request.getParameter("edadForm") != null) {
    		edadPersona = Integer.parseInt(request.getParameter("edadForm"));
    	} 
 	    if (accion.equalsIgnoreCase("agregar")) {
		    Persona personaAgregar = new Persona(nombrePersona, apellidoPersona, edadPersona);
			personadao.agregarPersona(personaAgregar);
			personadao = null;
	 	    response.sendRedirect("crud.jsp");


 	    } else if (accion.equalsIgnoreCase("eliminar")) {
 			int idPersona = Integer.parseInt(request.getParameter("id"));
			personadao.eliminarPersona(idPersona);
			personadao = null;
	 	    response.sendRedirect("crud.jsp");
	
		} else if (accion.equalsIgnoreCase("editar")) {
		    int idPersona = Integer.parseInt(request.getParameter("id"));

	      //Obtiene Persona por el ID //
		   Persona personaEditar = personadao.obtenerPersona(idPersona);
		   
		   // Setea Atributos al formulario de Edicion //
		   request.setAttribute("id", personaEditar.getId());
		   request.setAttribute("editNombre", personaEditar.getNombre());
		   request.setAttribute("editApellido", personaEditar.getApellido());  
		   request.setAttribute("editEdad", personaEditar.getEdad());
		   
		   //envia los datos por el request Dispacher //
		   request.getRequestDispatcher("update.jsp").forward(request, response);
		   		   
		} else if (accion.equalsIgnoreCase("actualizar")) {
			int idPersona = Integer.parseInt(request.getParameter("id"));

	 	    Persona personaActualizar = new Persona(idPersona, nombrePersona, apellidoPersona, edadPersona);
	 	    
	 	    personadao.actualizarPersona(personaActualizar);
	 	    response.sendRedirect("crud.jsp");
		   
		} 
	
		
	}

}
