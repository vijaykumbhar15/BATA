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
	      <li><a href="showDistrictManagerForm.jsp">Back</a></li>
	    </ul>
	  </div>
	</nav>
	
	<!-- <div class="container" style="padding-top: 100px; width: 100%;"> -->
		<center><div action="" method="post" style="overflow:scroll ; background-color: white; padding: 15px; width: 100%;">
			<h2>View Projection</h2><br><br>
			<table border="1" class="table table-striped">
				
				<thead>
					<!-- first row to display week no -->
					<tr style="font-weight: bold;">
						<td colspan="36" align="center">WEEK NO</td>
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
						String districtManagerID = session.getAttribute("userID").toString();
					
						float mLyTotal=0,mEstTotal=0,mProjTotal=0,mActTotal=0,tLyTotal=0,tEstTotal=0,tProjTotal=0,tActTotal=0,wLyTotal=0,wEstTotal=0,wProjTotal=0,wActTotal=0;
						float thLyTotal=0,thEstTotal=0,thProjTotal=0,thActTotal=0,fLyTotal=0,fEstTotal=0,fProjTotal=0,fActTotal=0,sLyTotal=0,sEstTotal=0,sProjTotal=0,sActTotal=0;
						float suLyTotal=0,suEstTotal=0,suProjTotal=0,suActTotal=0,weekLyTotal=0,weekEstTotal=0,weekProjTotal=0,weekActTotal=0;
						System.out.println("District Manager ID = "+districtManagerID);
					
						Connection con=DBConnection.getConnection();
						Statement stmt=con.createStatement();
												
						System.out.println("SELECT stm.stateName, districtID, districtName, DM_ID, storeID, storename, distID, SM_ID FROM districtmaster dm inner join storemaster sm inner join statemaster stm on dm.DM_ID=dm.DM_ID and sm.stateID=stm.stateID where dm.DM_ID='"+districtManagerID+"'");
						ResultSet rs= stmt.executeQuery("SELECT stm.stateName, districtID, districtName, DM_ID, storeID, storename, distID, SM_ID FROM districtmaster dm inner join storemaster sm inner join statemaster stm on dm.DM_ID=dm.DM_ID and sm.stateID=stm.stateID where dm.DM_ID='"+districtManagerID+"'");
						
						while(rs.next())
						{
					%>
					<tr>
						<td><%=rs.getString("storeID") %></td>
						<td><%=rs.getString("districtName") %></td>
						<td><%=rs.getString("stateName") %></td>
						<td><%=rs.getString("storename") %></td>
						
						<%
							Connection con1=DBConnection.getConnection();
							
							Statement stmt1=con1.createStatement();
							System.out.println("SELECT * FROM projectionentry WHERE storeID='"+rs.getString("storeID")+"' AND WeekNo=(select WeekNo from dsrcalendar where dateMatch = '"+TodayDate.getDateYMD()+"')");
							ResultSet rs1= stmt1.executeQuery("SELECT * FROM projectionentry WHERE storeID='"+rs.getString("storeID")+"' AND WeekNo=(select WeekNo from dsrcalendar where dateMatch = '"+TodayDate.getDateYMD()+"')");
							
							Statement stmt2=con1.createStatement();
							System.out.println("SELECT * FROM dailysalereport where storeID='"+rs.getString("storeID")+"' AND WeekNo=(select WeekNo from dsrcalendar where dateMatch = '"+TodayDate.getDateYMD()+"') ORDER BY Date");
							ResultSet rs2= stmt2.executeQuery("SELECT * FROM dailysalereport where storeID='"+rs.getString("storeID")+"' AND WeekNo=(select WeekNo from dsrcalendar where dateMatch = '"+TodayDate.getDateYMD()+"') ORDER BY Date");
							
							float monAct=0,tueAct=0,wedAct=0,thuAct=0,friAct=0,satAct=0,sunAct=0,storeWeekActTotal=0;
							
							
							if(rs1.next())
							{
								while(rs2.next())
								{
									String day=rs2.getString("day");
									System.out.println("Day is = "+day);
									
									if(day.equals("Monday"))
									{
										monAct = rs2.getFloat("Turnover_ACT");
										mActTotal+=monAct;
										System.out.println("Monday Value is set = "+monAct);
									}
									if(day.equals("Tuesday"))
									{
										tueAct = rs2.getFloat("Turnover_ACT");
										tActTotal+=tueAct;
										System.out.println("Tuesday Value is set = "+tueAct);
									}
									if(day.equals("Wednesday"))
									{
										wedAct = rs2.getFloat("Turnover_ACT");
										wActTotal+=wedAct;
										System.out.println("Wednesday Value is set = "+wedAct);
									}
									if(day.equals("Thursday"))
									{
										thuAct = rs2.getFloat("Turnover_ACT");
										thActTotal+=thuAct;
										System.out.println("Thursday Value is set = "+thuAct);
									}
									if(day.equals("Friday"))
									{
										friAct = rs2.getFloat("Turnover_ACT");
										fActTotal+=friAct;
										System.out.println("Friday Value is set = "+friAct);
									}
									if(day.equals("Saturday"))
									{
										satAct = rs2.getFloat("Turnover_ACT");
										sActTotal+=satAct;
										System.out.println("Saturday Value is set = "+satAct);
									}
									if(day.equals("Sunday"))
									{
										sunAct = rs2.getFloat("Turnover_ACT");
										suActTotal+=sunAct;
										System.out.println("Sunday Value is set = "+sunAct);
									}
								}
								storeWeekActTotal=monAct+tueAct+wedAct+thuAct+friAct+satAct+sunAct;
								
								weekActTotal+=storeWeekActTotal;
								
						%>
						
				 		<!-- Moday Data -->
						<td><%=rs1.getFloat("monLY") %></td>
						<%	mLyTotal+=rs1.getFloat("monLY");%>
						<td><%=rs1.getFloat("monETS") %></td>
						<%	mEstTotal+=rs1.getFloat("monETS");%>
						<td><%=rs1.getFloat("monPROJ") %></td>
						<%	mProjTotal+=rs1.getFloat("monPROJ");%>
						<td><%=monAct %></td>
						
						<!-- Tuesday Data-->
						<td><%=rs1.getFloat("tueLY") %></td>
						<%	tLyTotal+=rs1.getFloat("tueLY");%>
						<td><%=rs1.getFloat("tueETS") %></td>
						<%	tEstTotal+=rs1.getFloat("tueETS");%>
						<td><%=rs1.getFloat("tuePROJ") %></td>
						<%	tProjTotal+=rs1.getFloat("tuePROJ");%>
						<td><%=tueAct %></td>
						
						<!-- Wednesday Data-->
						<td><%=rs1.getFloat("wedLY") %></td>
						<%	wLyTotal+=rs1.getFloat("wedLY");%>
						<td><%=rs1.getFloat("wedEST") %></td>
						<%	wEstTotal+=rs1.getFloat("wedEST");%>
						<td><%=rs1.getFloat("wedPROJ") %></td>
						<%	wProjTotal+=rs1.getFloat("wedPROJ");%>
						<td><%=wedAct %></td>
						
						<!-- Thursday Data-->
						<td><%=rs1.getFloat("thuLY") %></td>
						<%	thLyTotal+=rs1.getFloat("thuLY");%>
						<td><%=rs1.getFloat("thuEST") %></td>
						<%	thEstTotal+=rs1.getFloat("thuEST");%>
						<td><%=rs1.getFloat("thuPROJ") %></td>
						<%	thProjTotal+=rs1.getFloat("thuPROJ");%>
						<td><%=thuAct %></td>
						
						<!-- Friday Data-->
						<td><%=rs1.getFloat("friLY") %></td>
						<%	fLyTotal+=rs1.getFloat("friLY");%>
						<td><%=rs1.getFloat("friEST") %></td>
						<%	fEstTotal+=rs1.getFloat("friEST");%>
						<td><%=rs1.getFloat("friPROJ") %></td>
						<%	fProjTotal+=rs1.getFloat("friPROJ");%>
						<td><%=friAct %></td>
						
						<!-- Saturday Data-->
						<td><%=rs1.getFloat("satLY") %></td>
						<%	sLyTotal+=rs1.getFloat("satLY");%>
						<td><%=rs1.getFloat("satEST") %></td>
						<%	sEstTotal+=rs1.getFloat("satEST");%>
						<td><%=rs1.getFloat("satPROJ") %></td>
						<%	sProjTotal+=rs1.getFloat("satPROJ");%>
						<td><%=satAct %></td>
						
						<!-- Sunday Data -->
						<td><%=rs1.getFloat("sunLY") %></td>
						<%	suLyTotal+=rs1.getFloat("sunLY");%>
						<td><%=rs1.getFloat("sunEST") %></td>
						<%	suEstTotal+=rs1.getFloat("sunEST");%>
						<td><%=rs1.getFloat("sunPROJ") %></td>
						<%	suProjTotal+=rs1.getFloat("sunPROJ");%>
						<td><%=sunAct %></td>
						
						<!-- Weekly Data -->
						<td><%=rs1.getFloat("weekLY") %></td>
						<%	weekLyTotal+=rs1.getFloat("weekLY");%>
						<td><%=rs1.getFloat("weekEST") %></td>
						<%	weekEstTotal+=rs1.getFloat("weekEST");%>
						<td><%=rs1.getFloat("weekPROJ") %></td>
						<%	weekProjTotal+=rs1.getFloat("weekPROJ");%>
						<td><%=storeWeekActTotal %></td>
						
						<%
					
						
							}
							else
							{
						%>
								<!-- Moday Data -->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
								
								<!-- Tuesday Data-->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
								<!-- Wednesday Data-->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
								<!-- Thursday Data-->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
								<!-- Friday Data-->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
								<!-- Saturday Data-->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
								<!-- Sunday Data -->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
								<!-- Weekly Data -->
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								<td>0.0</td>
								
						<%
							}
							rs1.close();
							rs2.close();
							stmt1.close();
							stmt2.close();
							con1.close();
						}
						rs.close();
						
						stmt.close();
						
						con.close();
						
						%>
					</tr>
					<tfoot style="font-weight: bold;">
					<tr>
						<td colspan="4" align="center">District TOTAL</td>
						<td><%=mLyTotal %></td>
						<td><%=mEstTotal %></td>
						<td><%=mProjTotal %></td>
						<td><%=mActTotal %></td>
						
						<td><%=tLyTotal %></td>
						<td><%=tEstTotal %></td>
						<td><%=tProjTotal %></td>
						<td><%=tActTotal %></td>
						
						<td><%=wLyTotal %></td>
						<td><%=wEstTotal %></td>
						<td><%=wProjTotal %></td>
						<td><%=wActTotal %></td>
						
						<td><%=thLyTotal %></td>
						<td><%=thEstTotal %></td>
						<td><%=thProjTotal %></td>
						<td><%=thActTotal %></td>
						
						<td><%=fLyTotal %></td>
						<td><%=fEstTotal %></td>
						<td><%=fProjTotal %></td>
						<td><%=fActTotal %></td>
						
						<td><%=sLyTotal %></td>
						<td><%=sEstTotal %></td>
						<td><%=sProjTotal %></td>
						<td><%=sActTotal %></td>
						
						<td><%=suLyTotal %></td>
						<td><%=suEstTotal %></td>
						<td><%=suProjTotal %></td>
						<td><%=suActTotal %></td>
						
						
						<td><%=weekLyTotal %></td>
						<td><%=weekEstTotal %></td>
						<td><%=weekProjTotal %></td>
						<td><%=weekActTotal %></td>
					</tr>	
				</tfoot> 
				
					
				
				</tbody>
			</table>
		</div></center>
	</div>	
</body>
</html> 