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
<title>Add Store</title>
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
  <form action="addStore" method="post">
	<div class="form-group"> 
	<h2 align="center">Add Store</h2>
	<br><br>
       <input type="text" class="form-control" name="storeID" placeholder="Store ID" required/>
  	</div>
  	<div class="form-group"> 
       <input type="text" class="form-control" name="storeName" placeholder="Store Name" required/>
  	</div>	
  	<div class="form-group"> 
 <select class="form-control" name="distID" required>
			<option value="0">--Select District--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select * from districtmaster");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("districtID")%>"><%=rs.getString("districtName")%></option>
						<%
					}
					con.close();
					rs.close();
					stmt.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				
			%>
			</select>  	
			</div>
			<div class="form-group"> 
<select class="form-control" name="stateID" required>
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
						<option value="<%=rs.getString("stateID")%>"><%=rs.getString("stateName")%></option>
						<%
					}
					con.close();
					rs.close();
					stmt.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
				
			%>
			</select>  	</div>	
			
			<div class="form-group"> 
				<select class="form-control" name="cmbSM_ID" required>
				<option value="0">--Select Store Manager ID--</option>
				<%
					try
					{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DBConnection.getConnection();
						Statement stmt=con.createStatement();
						ResultSet rs= stmt.executeQuery("select * from employeemaster where designation='Store_Manager'");
						while(rs.next())
						{
							%>
							<option value="<%=rs.getInt("empID")%>"><%=rs.getString("fname")%> <%=rs.getString("lname") %></option>
							<%
						}
						con.close();
						rs.close();
						stmt.close();
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
					
				%>
				</select>  	
			</div>
	
		
	<button type="submit" name="addStore">Add Store</button>
	<button type="reset" name="Clear" value="Clear">Clear</button>
	<button type="button" name="Cancle" value="Cancle" onClick="window.location='showDistrictManagerForm.jsp';">Cancel</button>
		
	</form>
</div>

</body>
</html>