package cl.talentodigital;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/Session")
public class Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Session() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	     PrintWriter out = response.getWriter();

		 String name = request.getParameter("userName");
	     String password = request.getParameter("userPassword");
	     String mensaje = null;
	     out.print("Bienvenido " + name);
	     
	     HttpSession session = request.getSession();
	  
	     // session.setMaxInactiveInterval(10);
	
	    out.print("\n");
	    
		if(name.equals("administrador") && password.equals("1234")) {
			session.setAttribute("session_name",name );
			session.setAttribute("session_password", password);
		    response.sendRedirect("add.jsp");

	    } else if(name.equals("administrador") && !password.equals("1234")){
	    
	    	mensaje = "Contraseña incorrecta.";
			session.setAttribute("mensaje", mensaje);
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
	    
	    }else {
		   
	    	  session.setAttribute("session_name",name );
			  session.setAttribute("session_password", password);		    
			  response.sendRedirect("index.jsp");

	    }
	    		
		
	}


		
	

}
