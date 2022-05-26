<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>    
	<%@page import="cl.talentodigital.*"%>
	
    <% ArrayList<Persona> listaPersona = (ArrayList) application.getAttribute("listaPersonaGlobal"); %> 
    
   	<%
		if (listaPersona != null ) { 	
	%>
    
		<table class="table table-striped table-hover shadow-sm" >
			
			<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Edad</th></tr>
			<%				
			for (int i = 0; i<listaPersona.size(); i++){
				
				%>
				<tr><td><%= listaPersona.get(i).getId()%></td>
					<td><%= listaPersona.get(i).getNombre()%></td>
					<td><%= listaPersona.get(i).getApellido()%></td>
					<td><%= listaPersona.get(i).getEdad()%></td>
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