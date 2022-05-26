<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@include file="includes/menu.jsp" %>

	<p>Cerrando sesión</p>
	<%session.invalidate(); 
	response.sendRedirect("login.jsp");%>
</body>
</html>