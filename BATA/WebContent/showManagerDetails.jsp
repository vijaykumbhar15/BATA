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

<title>Show Manager Details</title>
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
<div class="container" style="padding-top: 100px;">
	<form action="">
	<h2>Manager Details</h2><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Store Manager ID</th>
				<th>Store Manager First Name</th>
				<th>Store Manager Last Name</th>
				<th class="text-center">Action</th>	
			</tr>
		</thead>
		<tbody>
			<%
			Statement stmt=null;
			ResultSet rs;
			PreparedStatement pstmt=null;		
			Connection con=DBConnection.getConnection();
			stmt=con.createStatement();
			String query="SELECT * FROM employeemaster where designation='Store_Manager'";
			rs= stmt.executeQuery(query);
			while(rs.next())
			{
				%>
				
				<tr>
					<td><%=rs.getString("empID") %></td>
					<td><%=rs.getString("fname") %></td>
					<td><%=rs.getString("lname") %></td>
					<td>
						<a  class="button-style1" href='editDeleteStoreManager.jsp?empID=<%=rs.getString("empID") %>'>Edit</a>
						<a class="button-style2" href="#">Delete</a>
					</td>
				</tr>
				
				<%
			}
			%>
			
		</tbody>
	</table>
	</form>
</div>		
</body>
</html>