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
	<link rel="stylesheet" href="css/font-awesome.min.css">
<title>Add Region</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="showRegionalManagerForm.jsp ">Back</a></li>
    </ul>
  </div>
</nav>
<div class="container" style="padding-top: 60px;">
	<form action="addRegion" method="post">
	<div class="form-group"> 
	<br><br>
	<h2>Add Region</h2>
      <input type="text" class="form-control" name="regionID" placeholder="Region ID" required/>
  	</div>
  	<div class="form-group"> 
      <input type="text" class="form-control" name="distName" placeholder="District Name" required/>
  	</div>
  	<div class="form-group"> 
      <select class="form-control" name="stateID" onchange="">
			<option value="0">--Select State--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select * from statemaster");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getInt("stateID")%>"><%=rs.getString("stateName")%></option>
						<%
					}
					con.close();
					rs.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				
			%>
			</select>
  	</div>
  	<div class="form-group"> 
       <select class="form-control" name="cmbRM_ID" onchange="" required>
			<option value="0">--Select EMP ID--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select * from employeemaster where designation='Regional_Manager'");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getInt("empID")%>"><%=rs.getString("fname")%> <%=rs.getString("lname") %></option>
						<%
					}
					con.close();
					rs.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				
			%>
			</select>
  	</div>
	 
		
	<br><br><button type="submit" name="addRegion">Add Region</button>
	<button type="button" name="Clear">Clear</button>
	<button type="button" name="Cancle" onClick="window.location='showRegionalManagerForm.jsp';">Cancel</button>
		
	</form>
	</div>
</body>
</html>