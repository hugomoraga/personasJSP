<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>  
    <%@page import="java.util.List"%>    
      
	<%@page import="cl.talentodigital.*"%>
	
	<% PersonaDAO personadao = new PersonaDAO(); 
	
	
	%>
	
    <% List <Persona> listaPersona = personadao.listar(); %> 
    
   	<%
		if (listaPersona != null ) { 	
	%>
    
		<table class="table table-striped table-hover shadow-sm" >
			
			<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Edad</th><th>Acciones</th></tr>
			<%				
			for (int i = 0; i<listaPersona.size(); i++){
				
				%>
				<tr><td><%= listaPersona.get(i).getId()%></td>
					<td><%= listaPersona.get(i).getNombre()%></td>
					<td><%= listaPersona.get(i).getApellido()%></td>
					<td><%= listaPersona.get(i).getEdad()%></td>
					<td> <form action="Proccess" method="post">
							<input type="hidden" name="id" value="<%= listaPersona.get(i).getId()%>" />
							<input type="submit" name="accion"  value="Eliminar" class="btn btn-danger" />
							<input type="submit" name="accion" value="Editar" class="btn btn-warning" />
							
  						</form>
  					</td>
				</tr>
				<%
			}
				
			%>
			
		</table>

	<%
		} else {
	%>
	<p>No hay datos </p>
	<%
		}
	%>		
	
	<p>
 
  <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
Agregar Personas  </button>
</p>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
  
   <form class="p-3 shadow-sm m-3 " action="Proccess" method="post">
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

  
		<button id="Agregar" type="submit" name="accion" value="Agregar" class="btn btn-success">Agregar Persona</button>
	</form>
  
  </div>
</div>
	
	
	