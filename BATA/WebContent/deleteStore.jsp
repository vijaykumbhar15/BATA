<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.sv.dto.DBConnection"%>
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
<title>Edit Store</title>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="index.jsp">Company Name</a>
	    </div>
	    
	    <ul class="nav navbar-nav navbar-right">
	      
	      <li><a href="showDistrictManagerForm.jsp ">Back</a></li>
	    </ul>
	  </div>
	</nav>
	<div class="container" style="padding-top: 150px;">

		<%
		Connection con=null;
		Statement stmt=null;
		ResultSet rs;
		PreparedStatement pstmt=null;		
		con=DBConnection.getConnection();
					
						stmt=con.createStatement();
						String storeID=request.getParameter("storeID");
						String query="DELETE FROM storemaster where storeid='"+storeID+"'";
						stmt.execute(query);
					response.sendRedirect("showStoreDetails.jsp");
					
					%>	

</body>
</html>