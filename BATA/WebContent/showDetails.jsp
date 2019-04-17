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
<title>Show Details</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="showAdminPage.jsp">Back</a></li>
    </ul>
  </div>
</nav>
	
	<h2 align="center"> Search Data by designation</h2>
	<form action="showDetails.jsp" method="post">
	<div class="container" align="center">
		<select class="form-control" name="cmbDesignation" onchange="this.form.submit();">
			<option value="0">--Select Designation--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select distinct designation from employeemaster");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("designation")%>"><%=rs.getString("designation") %></option>
						<%
					}
					con.close();
					stmt.close();
					rs.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				
			%>
			
		</select>
	
	</div>
	</form>
	<br>
	<div align="center">
		<table>
			<tr>
				<th>Emp ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Designation</th>
			</tr>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					
					String designationValue=request.getParameter("cmbDesignation");
					
					System.out.println("select * from employeemaster where designation="+designationValue);
									
					
					ResultSet rs= stmt.executeQuery("select * from employeemaster where designation='"+designationValue+"'");
					 
					
					System.out.println("Hello Vijay");
					while(rs.next())
					{
						
						System.out.println("Hello From showDetails JSP"+rs.getString("empID")+""+rs.getString("fName")+""+rs.getString("lName"));
						%>
						<tr>
						<td><%=rs.getString("empID") %></td>
						<td><%=rs.getString("fName") %></td>
						<td><%=rs.getString("lName") %></td>
						<td><%=rs.getString("designation") %></td>
						</tr>
						<%

						System.out.println("After While loop");
					}
					con.close();
					stmt.close();
					rs.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
			%>
		
		</table>
	</div>
	
</body>
</html>