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
	<h2>Display Daily sale Report</h2>
	<div class="container">
	<form action="dispDailySaleReport" method="post">
			<br><br>Select Date : <input type="date" name="datetime" id="datetime" class="form-control" style="width: 40%;" required>
			<script>
							
				var dt=document.getElementsByName("datetime").valueAsDate = new Date();
				var sdt=dt.toString();
				console.log(sdt);
			</script>    
			<br><br>	
			<button type="submit" name="Show">Show Report</button>
			<button onClick="window.location='generateDailySaleReport.jsp';">Download Report</button>
			
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
					
					System.out.println("In Disp daly sale report DM_ID = "+session.getAttribute("userID"));
					
					String Date=request.getParameter("datetime");
					
					System.out.println("Date in dispdailysalereport.jsp is = "+Date);					
					
					session.setAttribute("date", Date);
										
					//if(!storeID.equals("null") || !Date.equals("null"))
					if(!Date.equals("null"))
					{
						Connection con=DBConnection.getConnection();
						Statement stmt=con.createStatement();					
						System.out.println("select * FROM districtmaster dist INNER JOIN storemaster store on dist.districtID = store.distID where DM_ID='"+session.getAttribute("userID")+"'");
						ResultSet rs= stmt.executeQuery("select * FROM districtmaster dist INNER JOIN storemaster store on dist.districtID = store.distID where DM_ID='"+session.getAttribute("userID")+"'");
																			
						System.out.println("Hello in DispDailySale report");
						while(rs.next())
						{
							String storeId = rs.getString("storeID");
							Statement stmt1=con.createStatement();
							System.out.println("select * from dailysalereport where storeID='"+storeId+"' AND Date='"+Date+"'");
							ResultSet rs1= stmt1.executeQuery("select * from dailysalereport where storeID='"+storeId+"' AND Date='"+Date+"'");
							
							if(rs1.next())
							{
								dpLY=dpLY+rs1.getFloat("LY_Pairs");
								dpEST=dpLY+rs1.getFloat("Pairs_EST");
								dpACT=dpACT+rs1.getFloat("Pairs_ACT");
								dpSEST=dpSEST+(rs1.getFloat("Pairs_ACT")/rs1.getFloat("Pairs_EST"));
								dpSALY=dpSALY+(rs1.getFloat("Pairs_ACT")/rs1.getFloat("LY_Pairs"));
								
								dtLY=dtLY+rs1.getFloat("LY_Turnover");
								dtEST=dtLY+rs1.getFloat("Turnover_EST");
								dtACT=dtACT+rs1.getFloat("Turnover_ACT");
								dtSEST=dtSEST+(rs1.getFloat("Turnover_ACT")/rs1.getFloat("Turnover_EST"));
								dtSALY=dtSALY+(rs1.getFloat("Turnover_ACT")/rs1.getFloat("LY_Turnover"));
															
								dNFTSales=dNFTSales+rs1.getFloat("NFT_Sale_Turnover");
								dNFTPercent=dNFTPercent+rs1.getFloat("NFT_Percent");
								
								dLadiesBag=dLadiesBag+rs1.getFloat("Laches_Handbag_PCS");
								
								dUPTLY=dUPTLY+rs1.getFloat("UPT_EY");
								dUPTTY=dUPTTY+rs1.getFloat("UPT_tY");
								
								dASP=dASP+(rs1.getFloat("Turnover_ACT")/rs1.getFloat("Pairs_ACT"));
								dMargin=dMargin+rs1.getFloat("Margin");
								dEOSSOPSTK=dEOSSOPSTK+rs1.getFloat("Disk_Opening_Stock");
								dEOSSCLSTK=dEOSSCLSTK+rs1.getFloat("Disk_Closing_Stock");
								dEOSSSALEPER=dEOSSSALEPER+rs1.getFloat("Disk_sale_Pairs");
								
								dNoOfBill=dNoOfBill+rs1.getFloat("No_Of_Bills");
								
							%>
								<tr>
									<td><%=rs.getString("storeID") %></td>
									<td><%=rs.getString("districtName") %></td>
									<td>STATE</td>
									<td><%=rs.getString("storename") %></td>
									<td><%=rs1.getFloat("LY_Pairs") %></td>
									<td><%=rs1.getFloat("Pairs_EST") %></td>
									<td><%=rs1.getFloat("Pairs_ACT") %></td>
									<td><%=df.format((rs1.getFloat("Pairs_ACT") /rs1.getFloat("Pairs_EST"))*100 )%>%</td>
									<td><%=df.format((rs1.getFloat("Pairs_ACT") /rs1.getFloat("LY_Pairs"))*100) %>%</td>
									<td><%=rs1.getFloat("LY_Turnover") %></td>
									<td><%=rs1.getFloat("Turnover_EST") %></td>
									<td><%=rs1.getFloat("Turnover_ACT") %></td>
									<td><%=df.format((rs1.getFloat("Turnover_ACT")/rs1.getFloat("Turnover_EST"))*100 )%>%</td>
									<td><%=df.format((rs1.getFloat("Turnover_ACT") /rs1.getFloat("LY_Turnover"))*100)%>%</td>
									<td><%=rs1.getFloat("NFT_Sale_Turnover") %></td>
									<td><%=df.format((rs1.getFloat("NFT_Sale_Turnover") /rs1.getFloat("Turnover_ACT"))*100)%>%</td>
									<td><%=rs1.getFloat("Laches_Handbag_PCS") %></td>
									<td><%=rs1.getFloat("UPT_EY") %></td>
									<td><%=rs1.getFloat("UPT_TY") %></td>
									<td><%=(rs1.getFloat("Turnover_ACT") /rs1.getFloat("Pairs_ACT"))%></td>
									<td><%=rs1.getFloat("Margin") %></td>
									<td><%=rs1.getFloat("NPS_Score") %></td>
									<td><%=rs1.getString("Impresso_Update") %></td>
									<td><%=rs1.getFloat("Disk_Opening_Stock") %></td>
									<td><%=rs1.getFloat("Disk_Closing_Stock") %></td>
									<td><%=rs1.getFloat("Disk_sale_Pairs") %></td>
									<td><%=rs1.getFloat("No_Of_Bills") %></td>
									<td></td>
									<td></td>
									<td>
										<a class="button-style1" onClick="return confirm();" href="editDispDailySaleReport.jsp?storeID=<%=storeId %>&Date=<%=Date%>">Edit</a>
									</td>
									
							</tr>
						</tbody>
						<%
							}
							else
							{
								
							%>
								<tr>
									<td><%=rs.getString("storeID") %></td>
									<td><%=rs.getString("districtName") %></td>
									<td>STATE</td>
									<td><%=rs.getString("storename") %></td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>NO</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td>0.0</td>
									<td></td>
									<td>EDIT</td>
									
							</tr>
						</tbody>
						<%
							}
						}
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