<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Personas.jsp</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
   
        <li class="nav-item">
          <a class="nav-link" href="privada.jsp">Lista Session</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="global.jsp">Lista Global</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="crud.jsp">Lista CRUD</a>
        </li>
        
      </ul>
       <div class="d-flex">
         <div class="d-flex">
		<%if(session.getAttribute("session_name") == null) {%>
		<a class="btn btn-info" href="login.jsp">Ingresar</a>
		<%} else { %>
		<a class="btn btn-danger" href="logout.jsp">Cerrar sesi�n</a>
		<%} %>
	  </div>
   
      </div>
     
    </div>
  </div>
</nav>