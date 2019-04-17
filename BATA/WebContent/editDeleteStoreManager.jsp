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
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
 </script>
<title>Edit / delete store manager</title>
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
<body>
	<div class="container" style="padding-top: 150px;">
		<%
		Connection con=null;
		Statement stmt=null;
		ResultSet rs;
		PreparedStatement pstmt=null;		
		con=DBConnection.getConnection();
					%>			
					<form Action="" method="post">
					<h2>Edit Store Manager</h2><br>
					<%
						stmt=con.createStatement();
						String empID=request.getParameter("empID");
						String query="SELECT * FROM employeemaster where empID='"+empID+"'";
						rs= stmt.executeQuery(query);
						while(rs.next())
						{
							%>
					<div class="form-group"> 
						<input type="text" class="form-control" name="empID" value='<%=rs.getString("empID") %>'  disabled/>
  					</div>
  					<div class="form-group"> 
						<input type="text" class="form-control" name="fName" value='<%=rs.getString("fName") %>' />
  					</div>
  					<div class="form-group"> 
						<input type="text" class="form-control" name="lName" value='<%=rs.getString("lName") %>'/>
  					</div>
  					
							<%
						}
						con.close();
						stmt.close();
						pstmt.close();
						rs.close();
						%>
						<button type="submit">Update</button><br><br>
						<a href="showDistrictManagerForm.jsp">Back</a>
						</form>
				</div>
</body>
</html>

<%
String ID=request.getParameter("empID");
String fName=request.getParameter("fName");
String lName=request.getParameter("lName");
if(ID!=null && fName!=null && lName!=null)
{
	String query1="update employeemaster set fname=?,lname=? where empID='"+ID+"'";
	pstmt=con.prepareStatement(query1);
	pstmt.setString(1,fName);
	pstmt.setString(2,lName);
	pstmt.executeUpdate();
	response.sendRedirect("showDistrictManagerForm.jsp");
}

%>