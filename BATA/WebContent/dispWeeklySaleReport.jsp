<%@page import="org.sv.dto.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.DecimalFormat"%>
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
	
<title>Display Daily sale report</title>
</head>
	<body style="overflow: auto;">

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
	
	<h2>Display Weekly sale Report</h2>
	<div class="container">
	<form action="dispWeeklySaleReport" method="post">
			<!-- <br><br>Select Date : <input type="date" name="datetime" id="datetime" class="form-control" style="width: 40%;" required>
			<script>
							
				var dt=document.getElementsByName("datetime").valueAsDate = new Date();
				var sdt=dt.toString();
				console.log(sdt);
			</script>  -->  
			
			
     		<select class="form-control" name="weekNo" required>
			<option value="0">--Select Week--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select weekNo from weeklysalereport");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("weekNo")%>"><%=rs.getString("weekNo")%></option>
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
		
			 
			<br><br>	
			<button type="submit" name="Show">Show Report</button>
			<button onClick="window.location='generateWeeklySaleReport.jsp';">Download Report</button>
			
		</form>	
		</div>	
		<div>
		
			<br><br>
			<table border="1" class="table table-striped">
				<thead>
					<!-- 
					fisrt row to display week no
					<tr>
						<td colspan="29" align="center">week no</td>
					</tr> -->
					
					<!-- Second Row to display Some Text -->
					<tr style="font-weight: bold;">
						<td rowspan="2">Store Code</td>
						<td rowspan="2">District</td>
						<td rowspan="2">State</td>
						<td rowspan="2">Store Name</td>
						<td colspan="5" align="center">PAIRS</td>
						<td colspan="5" align="center">TURNOVER</td>
						<td colspan="2" align="center">NFT TURNOVER</td>
						<td rowspan="2">Ladies Bags</td>
						<td colspan="2" align="center">UPT</td>
						<td rowspan="2">ASP</td>
						<td rowspan="2">MARGIN</td>
						<td rowspan="2">NPS SCORE</td>
						<td rowspan="2">IMPRESSO UPDTE</td>
						<td colspan="3" align="center">EOSS Clearance</td>
						<td rowspan="2">NO OF BILLS</td>
						<td colspan="2" align="center">MONI \ HD</td>
					</tr>
					
					<!-- Third Row to display Some Text -->
					<tr style="font-weight: bold;">
						<td>LY</td>
						<td>EST</td>
						<td>ACT</td>
						<td>SEST</td>
						<td>SALY</td>
						
						<td>LY</td>
						<td>EST</td>
						<td>ACT</td>
						<td>SEST</td>
						<td>SALY</td>
						
						<td>Sales</td>
						<td>%</td>
					
						<td>LY</td>
						<td>TY</td>
						
						<td>OP.STK</td>
						<td>CLS STK</td>
						
						<td>Sale PRS</td>
						
						<td>ORDER</td>
						<td>DELIVERY</td>
					</tr>
				</thead>
				<tbody>
					<!-- Row to display the actual data from database -->
					
				<%
				DecimalFormat df=new DecimalFormat("###.##");
				float dpLY=0,dpEST=0,dpACT=0,dpSEST=0,dpSALY=0,dtLY=0,dtEST=0,dtACT=0,dtSEST=0,dtSALY=0,dNFTSales=0,dNFTPercent=0,dLadiesBag=0;
				float dUPTLY=0,dUPTTY=0,dASP=0,dMargin=0,dEOSSOPSTK=0,dEOSSCLSTK=0,dEOSSSALEPER=0,dNoOfBill=0;
				int noOfStore=0;
				
				try
				{
					
				//	String storeID=request.getParameter("storeID");
					String weekNo=request.getParameter("weekNo");
					
				//	session.setAttribute("storeID", storeID);
					session.setAttribute("weekNo", weekNo);
					
					//if(!storeID.equals("null") || !Date.equals("null"))
					if(!weekNo.equals("null"))
					{
						Connection con=DBConnection.getConnection();
						Statement stmt=con.createStatement();
									
						//System.out.println("select * from dailysalereport where storeID='"+storeID+"' and '"+Date+"'");
									
						System.out.println("select * from weeklysalereport where weekNo='"+weekNo+"'");
						ResultSet rs= stmt.executeQuery("select * from weeklysalereport where weekNo='"+weekNo+"'");
						
						
						System.out.println("Hello in DispWeeklySale report");
						while(rs.next())
						{
							dpLY=dpLY+rs.getFloat("LY_pairs");
							dpEST=dpLY+rs.getFloat("pairs_est");
							dpACT=dpACT+rs.getFloat("pairs_ACT");
							dpSEST=dpSEST+(rs.getFloat("pairs_ACT")/rs.getFloat("pairs_est"));
							dpSALY=dpSALY+(rs.getFloat("pairs_ACT")/rs.getFloat("LY_pairs"));
							
							dtLY=dtLY+rs.getFloat("LY_Turnover");
							dtEST=dtLY+rs.getFloat("Turnover_EST");
							dtACT=dtACT+rs.getFloat("Turnover_ACT");
							dtSEST=dtSEST+(rs.getFloat("Turnover_ACT")/rs.getFloat("Turnover_EST"));
							dtSALY=dtSALY+(rs.getFloat("Turnover_ACT")/rs.getFloat("LY_Turnover"));
														
							dNFTSales=dNFTSales+rs.getFloat("NFT_Sale_Turnover");
							dNFTPercent=dNFTPercent+rs.getFloat("NFT_Percent");
							
							dLadiesBag=dLadiesBag+rs.getFloat("Laches_Handbag_PCS");
							
							dUPTLY=dUPTLY+rs.getFloat("UPT_EY");
							dUPTTY=dUPTTY+rs.getFloat("UPT_tY");
							
							dASP=dASP+(rs.getFloat("Turnover_ACT")/rs.getFloat("pairs_ACT"));
							dMargin=dMargin+rs.getFloat("Margin");
							dEOSSOPSTK=dEOSSOPSTK+rs.getFloat("Disk_Opening_Stock");
							dEOSSCLSTK=dEOSSCLSTK+rs.getFloat("Disk_Closing_Stock");
							dEOSSSALEPER=dEOSSSALEPER+rs.getFloat("Disk_sale_Pairs");
							
							dNoOfBill=dNoOfBill+rs.getFloat("No_Of_Bills");
							
						%>
							<tr>
							<td><%=rs.getString("storeID") %></td>
							<td>DISTRICT</td>
							<td>STATE</td>
							<td>STORE NAME</td>
							<td><%=rs.getFloat("LY_pairs") %></td>
							<td><%=rs.getFloat("pairs_est") %></td>
							<td><%=rs.getFloat("pairs_ACT") %></td>
							<td><%=df.format((rs.getFloat("pairs_ACT") /rs.getFloat("pairs_est"))*100 )%>%</td>
							<td><%=df.format((rs.getFloat("pairs_ACT") /rs.getFloat("LY_pairs"))*100) %>%</td>
							<td><%=rs.getFloat("LY_Turnover") %></td>
							<td><%=rs.getFloat("Turnover_EST") %></td>
							<td><%=rs.getFloat("Turnover_ACT") %></td>
							<td><%=df.format((rs.getFloat("Turnover_ACT")/rs.getFloat("Turnover_EST"))*100 )%>%</td>
							<td><%=df.format((rs.getFloat("Turnover_ACT") /rs.getFloat("LY_Turnover"))*100)%>%</td>
							<td><%=rs.getFloat("NFT_Sale_Turnover") %></td>
							<td><%=df.format((rs.getFloat("NFT_Sale_Turnover") /rs.getFloat("Turnover_ACT"))*100)%>%</td>
							<td><%=rs.getFloat("Laches_Handbag_PCS") %></td>
							<td><%=rs.getFloat("UPT_EY") %></td>
							<td><%=rs.getFloat("UPT_TY") %></td>
							<td><%=(rs.getFloat("Turnover_ACT") /rs.getFloat("pairs_ACT"))%></td>
							<td><%=rs.getFloat("Margin") %></td>
							<td><%=rs.getFloat("NPS_Score") %></td>
							<td><%=rs.getString("Impresso_Update") %></td>
							<td><%=rs.getFloat("Disk_Opening_Stock") %></td>
							<td><%=rs.getFloat("Disk_Closing_Stock") %></td>
							<td><%=rs.getFloat("Disk_sale_Pairs") %></td>
							<td><%=rs.getFloat("No_Of_Bills") %></td>
							<td></td>
							<td></td>
							
						</tr>
				</tbody><%
	
							System.out.println("After While loop");
						}
						
						//response.setContentType("application/vnd.ms-excel");
						//response.setHeader("Content-Disposition", "inline; filename=test.xls");
						con.close();
						rs.close();
					}
					else
					{
						
					}
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
			%>
				
				<tfoot style="font-weight: bold;">
					<tr>
						<td colspan="4" align="center">District TOTAL</td>
						<td><%=df.format(dpLY) %></td>
						<td><%=df.format(dpEST) %></td>
						<td><%=df.format(dpACT) %></td>
						<td><%=df.format(dpSEST) %></td>
						<td><%=df.format(dpSALY) %></td>
						<td><%=df.format(dtLY) %></td>
						<td><%=df.format(dtEST) %></td>
						<td><%=df.format(dtACT) %></td>
						<td><%=df.format(dtSEST) %></td>
						<td><%=df.format(dtSALY) %></td>
						<td><%=df.format(dNFTSales) %></td>
						<td><%=df.format(dNFTPercent) %></td>
						<td><%=df.format(dLadiesBag) %></td>
						<td><%=df.format(dUPTLY) %></td>
						<td><%=df.format(dUPTTY) %></td>
						<td><%=df.format(dASP) %></td>
						<td><%=df.format(dMargin) %></td>
						<td>NILL</td>
						<td>NILL</td>
						<td><%=df.format(dEOSSOPSTK) %></td>
						<td><%=df.format(dEOSSCLSTK) %></td>
						<td><%=df.format(dEOSSSALEPER) %></td>
						<td><%=dNoOfBill %></td>
						<td>NILL</td>
						<td>NILL</td>
					</tr>	
				</tfoot>
			</table>
		</div>
	</body>
</html>