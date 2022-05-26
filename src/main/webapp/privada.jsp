<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</head>
<body>
	<%@page import="java.util.ArrayList"%>
	<%@page import="cl.talentodigital.*"%>
	<%@include file="includes/menu.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-10 offset-1 py-4">



				<%
				if (session.getAttribute("session_name") != null) {
				%>

				<%@include file="includes/showlist-private.jsp"%>

				<%
				} else
					out.print("Seccion Privada. Inicia Sesion");
				%>
				
				<button class="btn btn-primary" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample">
					Agregar Personas</button>
				</p>
				<div class="collapse" id="collapseExample">
					<div class="card card-body">
					
					<jsp:include page="includes/addform.jsp" >
						  <jsp:param name="listaId" value="session" />
					</jsp:include>
					
					
					</div>
				</div>
 

			</div>
		</div>
	</div>
</body>
</html>