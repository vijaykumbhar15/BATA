<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="css/jquery.min.js"></script>
	<script src="css/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="css/style.css">
<title>Admin Form</title>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
    
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="logout.jsp ">Logout</a></li>
    </ul>
  </div>
</nav>
 
<div class="container"  style="padding-top: 100px;">
	<form action="">
	<%
			System.out.println("Designation in admin form ="+session.getAttribute("designation"));		
			if(session.getAttribute("userName")==null || !(session.getAttribute("designation").equals("admin")))
			{
				response.sendRedirect("login.jsp");
			}
			response.setHeader("Cache-Control", "no-cahce,no-store,must-revalidate"); 
			response.setHeader("Pragma", "no-cahce");
			response.setHeader("Expires", "0");
	%>
	
	<h2>Welcome in Admin Login</h2>
	<%-- <h2>Welcome <%=session.getAttribute("userName")%></h2><br> --%>
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='createNewEmployee.jsp';">Create New Employee</button>
		
	</div>	
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='showDetails.jsp';">Show Employee details</button>
		
	</div>
	
	</form>					
		
	</div>	
	
	</body>
</html>