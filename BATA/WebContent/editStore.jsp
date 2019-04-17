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
      
      <li><a href="showStoreDetails.jsp ">Back</a></li>
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
					%>			
					<form Action="" method="post" onsubmit="return validate(frm)">
					<h2>Edit Store</h2><br>
					<%
						stmt=con.createStatement();
						String storeID=request.getParameter("storeID");
						
						String query="SELECT * FROM storemaster where storeid='"+storeID+"'";
						rs= stmt.executeQuery(query);
						while(rs.next())
						{
							%>
					<div class="form-group"> 
						<input type="text" class="form-control" name="storeID" value='<%=rs.getString("storeID") %>'  disabled/>
  					</div>
  					<div class="form-group"> 
						<input type="text" class="form-control" name="storeName" value='<%=rs.getString("storeName") %>'/>
  					</div>		
					<div class="form-group"> 
						<input type="text" class="form-control" name="stateID" value='<%=rs.getString("stateID") %>'  disabled/>
  					</div>
  					<div class="form-group"> 
						<input type="text" class="form-control" name="distID" value='<%=rs.getString("distID") %>'  disabled/>
  					</div>
  					<div class="form-group"> 
						<input type="text" class="form-control" name="SM_ID" value='<%=rs.getString("SM_ID") %>'  disabled/>
  					</div>		
							
					<%
					}
						stmt.close();
						con.close();
						rs.close();
					%>
					<button type="submit">Update</button><br><br>
					<a href="showStoreDetails.jsp">Back</a>
					</form>
					</div>
				
</body>
</html>

<%
String ID=request.getParameter("storeID");
String storeName=request.getParameter("storeName");
if(ID!=null && storeName!=null)
{
	String query1="update storemaster set storeName=? where storeID='"+storeID+"'";
	pstmt=con.prepareStatement(query1);
	pstmt.setString(1,storeName);
	pstmt.executeUpdate();
	pstmt.close();
	response.sendRedirect("showDistrictManagerForm.jsp");
}

%>