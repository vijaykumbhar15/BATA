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
<!-- <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
 </script> -->
<title>View store Details</title>
</head>
<body>

<script type="text/javascript">
	function confirm()
	{
	    var doIt=confirm('Do you want to delete the record?');
	  	if(doIt){
	   		return true;
	    }
	  	else{
			return false;
	    }
	}
	
</script>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">DSR</a>
    </div>
    
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="showDistrictManagerForm.jsp ">Back</a></li>
    </ul>
  </div>
</nav>
<div class="container" style="padding-top: 100px;  width: 100%;">
<form action="addNewStoreManager" method="post">
<h2>Store Details</h2><br><br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Store ID</th>
				<th>Store Name</th>
				<th>State ID</th>
				<th>District ID</th>
				<th>Store Manager ID</th>	
				<th>Store Manager Contact</th>
			</tr>
		</thead>
		<tbody>
			<%
			Statement stmt=null;
			ResultSet rs;
			PreparedStatement pstmt=null;		
			Connection con=DBConnection.getConnection();
			stmt=con.createStatement();
			//String query="SELECT * FROM myfirstappdb.storemaster";
			
			String query="SELECT st.storeID,st.storeName,sta.stateName,dt.districtName,emp.fname,emp.lname,emp.mobileNo from storemaster as st join statemaster as sta join districtmaster as dt join employeemaster as emp WHERE st.stateID=sta.stateID and st.distID=dt.districtID and st.SM_ID=emp.empID";			
			rs= stmt.executeQuery(query);
			while(rs.next())
			{
				%>
				
				<tr>
					<td><%=rs.getString("StoreID") %></td>
					<td><%=rs.getString("StoreName") %></td>
					<td><%=rs.getString("stateName") %></td>
					<td><%=rs.getString("districtName") %></td>
					<td><%=rs.getString("fname")%> <%=rs.getString("lname") %></td>
					<td><%=rs.getString("mobileNo") %></td>
				</tr>
				
				
				<%
			}
			con.close();
			stmt.close();
			rs.close();
			%>
			
		</tbody>
	</table>
	</form>
	</div>	
</body>
</html>