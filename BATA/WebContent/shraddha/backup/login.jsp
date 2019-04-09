<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Window</title>
</head>
<body>

	<h3 align="left"><a href="index.jsp">Home</a></h3>
	<h3>Login</h3>
	<form action="loginServlet" method="post">
	
		<input type="text" name="userName"/>
		<input type="password" name="password"/>
	
	
		<input type="submit" name="login" value="login">	
	</form>
	
	<a href="registerNewUser.jsp">Register New user</a>
	
	

</body>
</html>