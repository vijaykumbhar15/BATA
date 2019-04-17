<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.sv.dto.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
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
<title>Register New user</title>
</head>
<body>
<h3 align="left"><a href="index.jsp">Home</a></h3>
	<form action="" method="post">
		<h3 align="center">Select the Employee ID to create the User</h3>
		<div class="container" align="center">
		<select class="form-control" name="empID" onchange="this.form.submit();" required>
			<option value="0">--Select Employee ID--</option>
			<%
				try
				{
					/* Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/MyFirstAppDB","root","root");
					 */
					 Connection con=DBConnection.getConnection();
					 Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select empID from employeemaster");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getInt("empID")%>"><%=rs.getInt("empID") %></option>
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
	<form action="registerNewUser" method="post">
	<div align="center">
		<%
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/MyFirstAppDB","root","root");
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					
					String empID=request.getParameter("empID");
					
					System.out.println("select * from employeemaster where designation="+empID);
									
					ResultSet rs= stmt.executeQuery("select * from employeemaster where empID='"+empID+"'");
					
					while(rs.next())
					{
						
						System.out.println("Hello From showDetails JSP"+rs.getString("empID")+""+rs.getString("fName")+""+rs.getString("lName"));
						%>
					<br><br>Employee ID : <input type="text" name="empID" value=<%=rs.getInt("empID")%> />
					<br><br>First Name : <input type="text" name="empfname" value=<%=rs.getString("fName") %> />
					<br><br>Last Name : <input type="text" name="emplname" value=<%=rs.getString("lName") %> />
					<br><br>Designation : <input type="text" name="empdesignation" value=<%=rs.getString("designation") %> />
					<br><br>User Name : <input type="text" name="userName" />
					<br><br>Password : <input type="password" name="password" />
					
					
					
					<br><br><input type="submit" value="Create User" name="createUser"> 
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
	
	</div>
	</form>
</body>
</html>