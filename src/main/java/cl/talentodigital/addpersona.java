package cl.talentodigital;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addpersona
 */
@WebServlet("/addpersona")
public class addpersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int idPersona = 1;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addpersona() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  
	     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	     

	     // Obtener Session 
	     HttpSession session = request.getSession();
	     
	     // Obtener Contexto Global
	     ServletContext context = request.getServletContext();
	     
	     // Añadir ArrayList al contexto Global
	     context.setAttribute("listaPersonaGlobal", Datos.listaPersonaGlobal);
	     
	     // Añadir ArrayList al contexto Privado
	     session.setAttribute("listaPersonaSession", Datos.listaPersonaSession);

	     
	     // Asigna variable de mensaje como null, y setea el atributo a la sesion.
	    String mensaje = null;
  		session.setAttribute("mensaje", mensaje);

	     
	     // Asignar variables desde formulario con try, para manejar excepciones en el formulario
  		

	     
	     try{
	    	 String nombreForm = request.getParameter("nombreForm");
	    	 String apellidoForm = request.getParameter("apellidoForm");
	 	     int edadForm = Integer.parseInt(request.getParameter("edadForm"));
	 	     String lista = request.getParameter("listaIdForm");	
	 	     System.out.println(lista);
	 	    

		 	    if(lista.equalsIgnoreCase("global")) {
		 			System.out.println("Estoy en global");
		 			System.out.println(edadForm);

		 	    	Persona personaGlobal = new Persona(idPersona++, nombreForm, apellidoForm, edadForm);
		 	    	System.out.println(personaGlobal.getApellido());
		 	    	
		 	    	Datos.listaPersonaGlobal.add(personaGlobal);
		 	    	
		 	    	response.sendRedirect("global.jsp");
		 	    	
		 	    	
		 		} else if (lista.equalsIgnoreCase("session")) {
		 			System.out.println("Estoy en session");
		 			Persona personaSession = new Persona(idPersona++,nombreForm, apellidoForm, edadForm);
		 			personaSession.getApellido();
		 			personaSession.getId();


		 			Datos.listaPersonaSession.add(personaSession);
			 	    response.sendRedirect("privada.jsp");
			 	    }
		 	    }
	     
	     catch (NumberFormatException e) {
	    	 //Si hay una excepcion en edad envia un mensaje a la pagina de agregar
	    	 mensaje = "Edad debe Ser un numero";
	    	 session.setAttribute("mensaje", mensaje);
	    	 System.out.println(e);
	    	 RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
	    	 rd.forward(request, response);
	    	 }
	     }
	

	

}
