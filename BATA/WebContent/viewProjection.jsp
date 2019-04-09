<%@page import="org.sv.dto.TodayDate"%>
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
<title>View Projection</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="index.jsp">DSR</a>
	    </div>
	    
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="showStoreManagerForm.jsp ">Back</a></li>
	    </ul>
	  </div>
	</nav>
	
	<!-- <div class="container" style="padding-top: 100px;  width: 100%;"> -->
		<form action="" method="post">
			<h2>View Projection</h2><br><br>
			<table border="1" class="table table-striped">
				
				<thead>
					<%
						String storeManagerID = session.getAttribute("userID").toString();
					
						System.out.println("Store Manager ID = "+storeManagerID);
					
						Connection con=DBConnection.getConnection();
						Statement stmt=con.createStatement();
						
						System.out.println("SELECT * from storemaster sm inner join projectionentry pe inner join statemaster stm inner join districtmaster dm on sm.storeId=pe.storeID and stm.stateID=sm.stateID and dm.districtID=sm.distID where sm.SM_ID='"+storeManagerID+"' and WeekNo = (select WeekNo from dsrcalendar where dateMatch = '"+TodayDate.getDateDMY()+"')");
						ResultSet rs= stmt.executeQuery("SELECT * from storemaster sm inner join projectionentry pe inner join statemaster stm inner join districtmaster dm on sm.storeId=pe.storeID and stm.stateID=sm.stateID and dm.districtID=sm.distID where sm.SM_ID='"+storeManagerID+"' and WeekNo = (select WeekNo from dsrcalendar where dateMatch = '"+TodayDate.getDateDMY()+"')");
						
						rs.next();
						
					%>
				
					<!-- fisrt row to display week no -->
					<tr style="font-weight: bold;">
						<td colspan="36" align="center">WEEK NO  <%=rs.getString("WeekNo") %></td>
					</tr>
					
					<!-- Second Row to display Some Text -->
					<tr style="font-weight: bold;">
						<td rowspan="2">Store Code</td>
						<td rowspan="2">District</td>
						<td rowspan="2">State</td>
						<td rowspan="2">Store Name</td>
						<td colspan="4" align="center">Monday</td>
						<td colspan="4" align="center">Tuesday</td>
						<td colspan="4" align="center">Wednesday</td>
						<td colspan="4" align="center">Thursday</td>
						<td colspan="4" align="center">Friday</td>
						<td colspan="4" align="center">Saturday</td>
						<td colspan="4" align="center">Sunday</td>
						<td colspan="4" align="center">Weekly</td>
						
					</tr>
					
					<!-- Third Row to display Some Text -->
					<tr style="font-weight: bold;">
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>Proj</td>
						<td>ACT</td>
						
					</tr>
				</thead>
				<tbody>
					<!-- Row to display the actual data from database -->
					<%
						
					%>
					<tr>
						<td><%=rs.getString("storeID") %></td>
						<td><%=rs.getString("districtName") %></td>
						<td><%=rs.getString("stateName") %></td>
						<td><%=rs.getString("storename") %></td>
						
						
						<!-- Moday Data -->
						<td><%=rs.getString("monLY") %></td>
						<td><%=rs.getString("monETS") %></td>
						<td><%=rs.getString("monPROJ") %></td>
						<td><%=0 %></td>
						
						
						<!-- Tuesday Data-->
						<td><%=rs.getString("tueLY") %></td>
						<td><%=rs.getString("tueETS") %></td>
						<td><%=rs.getString("tuePROJ") %></td>
						<td><%=0 %></td>
						
						<!-- Wednesday Data-->
						<td><%=rs.getString("wedLY") %></td>
						<td><%=rs.getString("wedEST") %></td>
						<td><%=rs.getString("wedPROJ") %></td>
						<td><%=0 %></td>
						
						<!-- Thursday Data-->
						<td><%=rs.getString("thuLY") %></td>
						<td><%=rs.getString("thuEST") %></td>
						<td><%=rs.getString("thuPROJ") %></td>
						<td><%=0 %></td>
						
						<!-- Friday Data-->
						<td><%=rs.getString("friLY") %></td>
						<td><%=rs.getString("friEST") %></td>
						<td><%=rs.getString("friPROJ") %></td>
						<td><%=0 %></td>
						
						<!-- Saturday Data-->
						<td><%=rs.getString("satLY") %></td>
						<td><%=rs.getString("satEST") %></td>
						<td><%=rs.getString("satPROJ") %></td>
						<td><%=0 %></td>
						
						<!-- Sunday Data -->
						<td><%=rs.getString("sunLY") %></td>
						<td><%=rs.getString("sunEST") %></td>
						<td><%=rs.getString("sunPROJ") %></td>
						<td><%=0 %></td>
						
						<!-- Weekly Data -->
						<td><%=rs.getString("weekLY") %></td>
						<td><%=rs.getString("weekEST") %></td>
						<td><%=rs.getString("weekPROJ") %></td>
						<td><%=0 %></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>	
</body>
</html>