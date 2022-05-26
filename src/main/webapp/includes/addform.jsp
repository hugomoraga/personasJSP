<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 		
	 <% if (session.getAttribute("session_name") == null ){
		 out.print("No haz iniciado sesion");
	 } else { 
		 
	 %>
 
 <form class="p-3 shadow-sm m-3 " action="addpersona" method="post">
	  <div class="mb-3">
	    <label for="nombre" class="form-label">Nombre</label>
	    <input type="text" class="form-control" name="nombreForm">
	  </div>
	  <div class="mb-3">
	    <label for="apellido" class="form-label">Apellido</label>
	    <input type="text" class="form-control" name="apellidoForm">
	  </div>
	  <div class="mb-3">
	    <label for="edad" class="form-label">Edad</label>
	    <input type="text" class="form-control" name="edadForm">
	  </div>
	<input type="hidden" value="${param.listaId}" name="listaIdForm" />
	<button type="submit" class="btn btn-primary">Agregar</button>
	</form>
	 
<% 
	 }
	 %>
		
			
		<% 
			Object mensaje = session.getAttribute("mensaje");
			
			if (mensaje != null) {
		
			out.print("<div class=' m-3 alert alert-warning alert-dismissible fade show' role='alert'>" 
						+ mensaje.toString() 
						+ "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
			
			session.setAttribute("mensaje", null);
			}
			
		%>
			
		
