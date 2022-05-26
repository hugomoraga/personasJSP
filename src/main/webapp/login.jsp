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
		<div class="col-8 offset-2">
		
		<%Object mensaje = session.getAttribute("mensaje");
	if(mensaje != null){
		out.print(mensaje.toString());
		session.invalidate();
	}
	%>
		
		
			<div class="p-4">
			<form class="p-3 shadow-sm m-4 " action="Session" class="shadow-sm m-3" method="post">
			  <div class="mb-3">
			  	<label for="nombre" class="form-label">Nombre</label>
			  	<input type="text" name="userName"/>
			  </div>
			  <div class="mb-3">
			  	<label for="nombre" class="form-label">Nombre</label>
			  	<input type="password" name="userPassword"/>
			  </div>
  			<input  class="btn btn-primary" type="submit" value="submit"/>
  
			</form>
			</div>
		</div>
	</div>
</div>


</body>
</html>