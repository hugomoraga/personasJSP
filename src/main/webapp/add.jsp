<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>
<%@include file="includes/menu.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-10 offset-1">
	
		
	 <% if (session.getAttribute("session_name") == null ){
		 out.print("No haz iniciado sesion");
	 } else { 
		 
	 %>
	<h3 class="text-center text-info p-4">Bienvenido <%=  session.getAttribute("session_name")%></h3>
	<h4 class="text-center">Agregar Personas a las Listas</h4>
	 
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
	  
	  <% if (session.getAttribute("session_name").equals("administrador") ){ %>
	  <div class="mb-3">
		  <div class="row">
		  <div class="col-4">
		  <div class="form-check">
	  		<input class="form-check-input" type="checkbox" value="on" id="flexCheckDefault" name="global">
	  		<label class="form-check-label" for="flexCheckDefault">Lista Global</label>
	 	  </div>
	 	  </div>
	 	  <div class="col-4">
	
		  
		  <div class="form-check">
	  		<input class="form-check-input" type="checkbox" value="on" id="flexCheckDefault" name="db">
	  		<label class="form-check-label" for="flexCheckDefault">Lista Base de Datos</label>
	 	  </div>
	 	  </div>
	 	  </div>
	 </div>
  <% } %>
  
	
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
			
		
		</div>
	</div>

</div>

</body>
</html>