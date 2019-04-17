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
<title>Insert title here</title>
</head>
<body>

		<div align="center" class="container">
		
			<table border="1" align="center" width="100%;" class="table table-striped" style="text-align: center;">
				<thead>
					
					<!-- Fisrt Row to display Week No -->
					<tr>
						<td colspan="29" align="center">WEEK NO</td>
					</tr>
					
					<!-- Second Row to display Some Text -->
					<tr>
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
					<tr>
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
				
				float dpLY=0,dpEST=0,dpACT=0,dpSEST=0,dpSALY=0,dtLY=0,dtEST=0,dtACT=0,dtSEST=0,dtSALY=0,dNFTSales=0,dNFTPercent=0,dLadiesBag=0;
				float dUPTLY=0,dUPTTY=0,dASP=0,dMargin=0,dEOSSOPSTK=0,dEOSSCLSTK=0,dEOSSSALEPER=0,dNoOfBill=0;
				int noOfStore=0;
				try
				{
					
				//	String storeID=request.getParameter("storeID");
					String weekNo=(String)session.getAttribute("weekNo");
					System.out.println("In generate Report "+weekNo);
				//	session.setAttribute("storeID", storeID);
					
					
					//if(!storeID.equals("null") || !Date.equals("null"))
					if(!weekNo.equals("null"))
					{
						Connection con=DBConnection.getConnection();
						Statement stmt=con.createStatement();
									
						//System.out.println("select * from dailysalereport where storeID='"+storeID+"' and '"+Date+"'");
									
						System.out.println("select * from weeklysalereport where weekNo='"+weekNo+"'");
					
						ResultSet rs= stmt.executeQuery("select * from weeklysalereport where weekNo='"+weekNo+"'");
						
						//ResultSet rs= stmt.executeQuery("select * from dailysalereport where storeID='"+storeID+"' and Date='"+Date+"'");
						//ResultSet rs= stmt.executeQuery("select * from dailysalereport where storeID='1131' and Date='2018-10-07'");
					
						System.out.println("Hello in Generate Weekly Sale report");
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
							<td><%=rs.getString("LY_pairs") %></td>
							<td><%=rs.getString("pairs_est") %></td>
							<td><%=rs.getString("pairs_ACT") %></td>
							<td><%=(Float.parseFloat(rs.getString("pairs_ACT")) /Float.parseFloat(rs.getString("pairs_est")))*100%>%</td>
							<td><%=(Float.parseFloat(rs.getString("pairs_ACT")) /Float.parseFloat(rs.getString("LY_pairs")))*100%>%</td>
							<td><%=rs.getString("LY_Turnover") %></td>
							<td><%=rs.getString("Turnover_EST") %></td>
							<td><%=rs.getString("Turnover_ACT") %></td>
							<td><%=(Float.parseFloat(rs.getString("Turnover_ACT")) /Float.parseFloat(rs.getString("Turnover_EST")))*100 %>%</td>
							<td><%=(Float.parseFloat(rs.getString("Turnover_ACT")) /Float.parseFloat(rs.getString("LY_Turnover")))*100%>%</td>
							<td><%=rs.getString("NFT_Sale_Turnover") %></td>
							<td><%=(Float.parseFloat(rs.getString("NFT_Sale_Turnover")) /Float.parseFloat(rs.getString("Turnover_ACT")))*100%>%</td>
							<td><%=rs.getString("Laches_Handbag_PCS") %></td>
							<td><%=rs.getString("UPT_EY") %></td>
							<td><%=rs.getString("UPT_TY") %></td>
							<td><%=Float.parseFloat(rs.getString("Turnover_ACT")) /Float.parseFloat(rs.getString("pairs_ACT"))%></td>
							<td><%=rs.getString("Margin") %></td>
							<td><%=rs.getString("NPS_Score") %></td>
							<td><%=rs.getString("Impresso_Update") %></td>
							<td><%=rs.getString("Disk_Opening_Stock") %></td>
							<td><%=rs.getString("Disk_Opening_Stock") %></td>
							<td><%=rs.getString("Disk_sale_Pairs") %></td>
							<td><%=rs.getString("No_Of_Bills") %></td>
							<td>Order</td>
							<td>Delivery</td>
							
						</tr>
				</tbody><%
	
							System.out.println("After While loop");
						}
						response.setContentType("application/vnd.ms-excel");
						response.setHeader("Content-Disposition", "inline; filename=WeeklySaleReport_"+weekNo+".xls");
					
						con.close();
						stmt.close();
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
						<td><%=dpLY %></td>
						<td><%=dpEST %></td>
						<td><%=dpACT %></td>
						<td><%=dpSEST %></td>
						<td><%=dpSALY %></td>
						<td><%=dtLY %></td>
						<td><%=dtEST %></td>
						<td><%=dtACT %></td>
						<td><%=dtSEST %></td>
						<td><%=dtSALY %></td>
						<td><%=dNFTSales %></td>
						<td><%=dNFTPercent %></td>
						<td><%=dLadiesBag %></td>
						<td><%=dUPTLY %></td>
						<td><%=dUPTTY %></td>
						<td><%=dASP %></td>
						<td><%=dMargin %></td>
						<td>NILL</td>
						<td>NILL</td>
						<td><%=dEOSSOPSTK %></td>
						<td><%=dEOSSCLSTK %></td>
						<td><%=dEOSSSALEPER %></td>
						<td><%=dNoOfBill %></td>
						<td>NILL</td>
						<td>NILL</td>
					</tr>	
				</tfoot>
			</table>
		</div>
		
</body>