<%@page import="org.sv.dto.DBConnection"%>
<%@page import="org.sv.dto.TodayDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<title>Store Manager Form</title>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">DSR</a>
    </div>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="changePassword.jsp ">Change Password</a></li>
      <li><a href="logout.jsp ">Logout</a></li>
    </ul>
  </div>
</nav>
 
<div class="container"  style="padding-top: 100px;">
	<form action="">
	<%
			System.out.println("Designation in Store Manager form ="+session.getAttribute("designation"));		
			if(session.getAttribute("userName")==null || !(session.getAttribute("designation").equals("Store_Manager"))) 
			{
				response.sendRedirect("login.jsp");
			}
			response.setHeader("Cache-Control", "no-cahce,no-store,must-revalidate"); 
			response.setHeader("Pragma", "no-cahce");
			response.setHeader("Expires", "0");
	%>
	
	<h2>Welcome <%=session.getAttribute("fName") %> <%=session.getAttribute("lName") %></h2>
	<div class="col-sm-6">
	
		<%
		
		Connection con2 = DBConnection.getConnection();
		String todayDate = TodayDate.getDateYMD();
		
		Statement stmt3 = con2.createStatement(); 
		
		System.out.println("SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"'");
		ResultSet rs3 = stmt3.executeQuery("SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"'");
		rs3.next();
		String storeID = rs3.getString("StoreID");
		
		
		Statement stmt4 = con2.createStatement(); 
		ResultSet rs4 = stmt4.executeQuery("SELECT * from dailysalereport where storeID='"+storeID+"' AND Date='"+todayDate+"'");
		if(rs4.next())
		{
			%>
			<button type="button" class="btn btn-default btn-wide" onClick="window.location='dailySaleReport.jsp';" disabled="disabled">Daily Sale Report Entry</button>
			<%
		}
		else
		{
			%>
			<button type="button" class="btn btn-default btn-wide" onClick="window.location='dailySaleReport.jsp';">Daily Sale Report Entry</button>
			<%
		}
		
		
		%>
	
		
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='weeklySaleReport.jsp';">Weekly Report</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='cashTally.jsp';">Cash Tally</button>
	</div>	
	<div class="col-sm-6">
		
		<%
			/* Connection con2 = DBConnection.getConnection();
			String todayDate = TodayDate.getDateYMD();
			Statement stmt2 = con2.createStatement(); 
			Statement stmt3 = con2.createStatement(); 
			
			System.out.println("SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"'");
			ResultSet rs3 = stmt3.executeQuery("SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"'");
			
			System.out.println("SELECT weekNo FROM dsrcalendar where dateMatch='"+todayDate+"'");
			ResultSet rs2 = stmt2.executeQuery("SELECT weekNo FROM dsrcalendar where dateMatch='"+todayDate+"'");
			
			rs3.next();
			 */
			Statement stmt2 = con2.createStatement(); 
			System.out.println("SELECT weekNo FROM dsrcalendar where dateMatch='"+todayDate+"'");
			ResultSet rs2 = stmt2.executeQuery("SELECT weekNo FROM dsrcalendar where dateMatch='"+todayDate+"'");
			rs2.next();
			ResultSet rs5 = stmt4.executeQuery("SELECT * from projectionentry where storeID='"+storeID+"' AND weekNo='"+rs2.getString("weekNo")+"'");
			if(rs5.next())
			{
				%>
				<button type="button" class="btn btn-default btn-wide" onClick="window.location='projectionEntry.jsp';" disabled="disabled">Projection Entry</button>
				<%
			}
			else
			{
				%>
				<button type="button" class="btn btn-default btn-wide" onClick="window.location='projectionEntry.jsp';">Projection Entry</button>
				<%
			}
			con2.close();
		%>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='viewStoreManagerProjection.jsp';">View Projection</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='cashtallyentry.jsp';">Cash Inventory</button>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<%
		Connection con=DBConnection.getConnection();
		
		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();
		float weeklyAchievement=0, balanceAgainstProjection=0, balanceAgainstEstimates=0, totalProjection=0,totalEstimate=0,weeklyEstimate=0;
				
		System.out.println("SELECT * FROM dailysalereport WHERE storeID=(SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"') AND WeekNo=(SELECT weekNo FROM dsrcalendar where dateMatch='"+TodayDate.getDateYMD()+"')");
		ResultSet rs= stmt.executeQuery("SELECT * FROM dailysalereport WHERE storeID=(SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"') AND WeekNo=(SELECT weekNo FROM dsrcalendar where dateMatch='"+TodayDate.getDateYMD()+"')");
		
		while(rs.next())
		{
			weeklyAchievement+=rs.getFloat("Turnover_ACT");
			weeklyEstimate += rs.getFloat("Turnover_EST");
			System.out.println("Hello");
		}
		
		System.out.println("SELECT * FROM projectionentry WHERE storeID=(SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"') AND WeekNo=(SELECT weekNo FROM dsrcalendar where dateMatch='"+TodayDate.getDateYMD()+"')");
		ResultSet rs1= stmt1.executeQuery("SELECT * FROM projectionentry WHERE storeID=(SELECT storeID from storemaster where SM_ID='"+session.getAttribute("userID")+"') AND WeekNo=(SELECT weekNo FROM dsrcalendar where dateMatch='"+TodayDate.getDateYMD()+"')");
		
		while(rs1.next())
		{
			totalProjection += rs1.getFloat("weekPROJ");
			totalEstimate +=rs1.getFloat("weekEST");
			
		}
		balanceAgainstEstimates = totalEstimate - weeklyEstimate;
		balanceAgainstProjection = totalProjection - weeklyAchievement;
		
		con.close();
	%>
	
	<div class="col-xs-4">
		Weekly Achievement<input type="text" class="form-control" name="weeklyAchivement" value="<%=weeklyAchievement %>" disabled="disabled">
	 </div>
	 <div class="col-xs-4">
		Balance Against Projection<input type="text" class="form-control" name="balanceAgainstProjection" value="<%=balanceAgainstProjection%>" disabled="disabled">
	 </div>
	 <div class="col-xs-4">
		Balance Against Estimates<input type="text" class="form-control" name="balanceAgainstEstimate" value="<%=balanceAgainstEstimates %>" disabled="disabled">
	 </div><br><br><br><br>
	 	 
	</form>					
		
	</div>	
	
	</body>
</html>