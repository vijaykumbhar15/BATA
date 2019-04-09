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
<title>Daily Sale Report</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="login.jsp ">Logout</a></li>
    </ul>
  </div>
</nav>
<div class="container" style="padding-top: 60px;">
	<form action="" class="from-group text-center">
	
	<%
			System.out.println("Designation in Regional Manager form ="+session.getAttribute("designation"));		
			if(session.getAttribute("userName")==null || !(session.getAttribute("designation").equals("Regional_Manager")))
			{
				response.sendRedirect("login.jsp");
			}
			response.setHeader("Cache-Control", "no-cahce,no-store,must-revalidate"); 
			response.setHeader("Pragma", "no-cahce");
			response.setHeader("Expires", "0");
			
		
	%>
	<h2>Welcome <%=session.getAttribute("fName") %> <%=session.getAttribute("lName") %></h2>
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='dispDailySaleReport.jsp';">Daily Report</button>
		<button type="button" class="btn btn-default btn-wide" href="#">Weekly Report</button>
		<button type="button" class="btn btn-default btn-wide" href="#">DM-Wise Weekly Report</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='addDistrict.jsp';">Add District</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='addRegion.jsp';">Add Region</button>
	</div>
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='dispDailySaleReport.jsp';">DM Projection</button>
		<button type="button" class="btn btn-default btn-wide" href="#">District Wise YTD Report</button>
		<button type="button" class="btn btn-default btn-wide" href="#">Region Wise YTD Report</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='createNewEmployee.jsp';">Create new Employee</button>
		<button type="button" class="btn btn-default btn-wide" href="#">Assign DM Estimates</button>
	</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</form>
	</div>
		
</body>
</html>