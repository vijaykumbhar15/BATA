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
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">DSR</a>
    </div>
    
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="dispDailySaleReport.jsp ">Back</a></li>
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
					<h2>Edit Daily Sale Report</h2><br>
					<%
						stmt=con.createStatement();
						String storeID=request.getParameter("storeID");
						String Date=request.getParameter("Date");
						String query="select * from dailysalereport where storeID='"+storeID+"' AND Date='"+Date+"'";
						System.out.println(query);
						rs= stmt.executeQuery(query);
						while(rs.next())
						{
						%>
						<div class="form-group col-xs-4">
					      STORE ID: <input type="text" class="form-control" id="storeID" name="storeID" value="<%=rs.getString("storeID") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					      Date: <input type="text" class="form-control" id="Date" name="Date" value="<%=rs.getString("Date") %>" required>
					    </div>
					
						<div class="form-group col-xs-4">
					      LY PAIRS: <input type="text" class="form-control" id="lyPairs" name="lyPairs" value="<%=rs.getString("LY_Pairs") %>" required>
					    </div>
    					<div class="form-group col-xs-4">
      					  EST PAIRS: <input type="text" class="form-control" id="estPairs" name="estPairs" value="<%=rs.getString("Pairs_EST") %>" required>
    					</div>
    					<div class="form-group col-xs-4">
      					  ACT PAIRS:	<input type="text" class="form-control" id="actPairs" name="actPairs" value="<%=rs.getString("Pairs_ACT") %>" required>
    					</div>
   						<div class="form-group col-xs-4">
					      LY_Turnover: <input type="text" class="form-control" id="lyTurnover" name="lyTurnover" value="<%=rs.getString("LY_Turnover") %>" required>
					    </div>
    					<div class="form-group col-xs-4">
      					EST_Turnover: <input type="text" class="form-control" id="estTurnover" name="estTurnover" value="<%=rs.getString("Turnover_EST") %>" required>
    					</div> 
					    <div class="form-group col-xs-4">
					     ACT_Turnover: <input type="text" class="form-control" id="actTurnover" name="actTurnover" value="<%=rs.getString("Turnover_ACT") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					    NFT_Sale_Turnover  <input type="text" class="form-control" id="nftSaleTurnover" name="nftSaleTurnover" value="<%=rs.getString("NFT_Sale_Turnover") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     NFT_Percent <input type="text" class="form-control" id="nftPercent" name="nftPercent" value="<%=rs.getString("NFT_Percent") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     Margin <input type="text" class="form-control" id="margin" name="margin" value="<%=rs.getString("Margin") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     UPT_EY <input type="text" class="form-control" id="uptEy" name="uptEy" value="<%=rs.getString("UPT_EY") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     UPT_TY <input type="text" class="form-control" id="uptTy" name="uptTy" value="<%=rs.getString("UPT_TY") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     Laches_Handbag_PCS <input type="text" class="form-control" id="lachesHandbagPCS" name="lachesHandbagPCS" value="<%=rs.getString("Laches_Handbag_PCS") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     Disk_Opening_Stock <input type="text" class="form-control" id="diskOpeningStock" name="diskOpeningStock" value="<%=rs.getString("Disk_Opening_Stock") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     Disk_sale_Pairs <input type="text" class="form-control" id="disckSalePairs" name="disckSalePairs" value="<%=rs.getString("Disk_sale_Pairs") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     Disk_Closing_Stock <input type="text" class="form-control" id="diskClosingStock" name="diskClosingStock" value="<%=rs.getString("Disk_Closing_Stock") %>" required>
					    </div>
					    <div class="form-group col-xs-4">
					     No_Of_Bills <input type="text" class="form-control" id="noOfBills" name="noOfBills" value="<%=rs.getString("No_Of_Bills") %>" required>
					    </div>
   
						 <div class="form-group col-xs-4">
					      NPS_Score<input type="text" class="form-control" id="npsScore" placeholder="NPS Score" name="npsScore" value="<%=rs.getString("NPS_Score") %>" required>
					    </div>
					     <div class="form-group col-xs-4">
					      order<input type="text" class="form-control" id="order" placeholder="Order" name="order" value="<%=rs.getString("order") %>" required>
					    </div>
					     <div class="form-group col-xs-4">
					      fulfilled<input type="text" class="form-control" id="fulfilled" placeholder="Fulfilled" name="fulfilled" value="<%=rs.getString("fulfilled") %>" required>
					    </div>	
    				
							
					<%
					}
					%>
					<button type="submit">Update</button><br><br>
					<a href="dispDailySaleReport.jsp">Back</a>
					</form>
					</div>

</body>
</html>


<%
String storeId=request.getParameter("storeID");
String date=request.getParameter("Date");
String LY_Pairs=request.getParameter("LY_Pairs");
String Pairs_EST=request.getParameter("Pairs_EST");
String Pairs_ACT=request.getParameter("Pairs_ACT");


String LY_Turnover=request.getParameter("LY_Turnover");
String Turnover_EST=request.getParameter("Turnover_EST");
String Turnover_ACT=request.getParameter("Turnover_ACT");
String NFT_Sale_Turnover=request.getParameter("NFT_Sale_Turnover");

String NFT_Percent=request.getParameter("NFT_Percent");
String Margin=request.getParameter("Margin");
String UPT_EY=request.getParameter("UPT_EY");
String UPT_TY=request.getParameter("UPT_TY");

String Laches_Handbag_PCS=request.getParameter("Laches_Handbag_PCS");
String Disk_Opening_Stock=request.getParameter("Disk_Opening_Stock");
String Disk_sale_Pairs=request.getParameter("Disk_sale_Pairs");
String Disk_Closing_Stock=request.getParameter("Disk_Closing_Stock");

String No_Of_Bills=request.getParameter("No_Of_Bills");
String NPS_Score=request.getParameter("NPS_Score");
String order_no=request.getParameter("order");
String fulfilled=request.getParameter("fulfilled");

if(storeId!=null && date!=null && LY_Pairs!=null && Pairs_EST!=null && Pairs_ACT!=null && LY_Turnover!=null && Turnover_EST!=null && Turnover_ACT!=null && NFT_Sale_Turnover!=null && NFT_Percent!=null && Margin!=null && UPT_EY!=null && UPT_TY!=null && Laches_Handbag_PCS!=null && Disk_Opening_Stock!=null && Disk_sale_Pairs!=null && Disk_Closing_Stock!=null && No_Of_Bills!=null && NPS_Score!=null && order_no!=null && fulfilled!=null)
{
	String query1="update dailysalereport set LY_Pairs=?, Pairs_EST=?, Pairs_ACT=?, LY_Turnover=?, Turnover_EST=?, Turnover_ACT=?, NFT_Sale_Turnover=?, NFT_Percent=?,Margin=?, UPT_EY=?, UPT_TY=?, Laches_Handbag_PCS=?, Disk_Opening_Stock=?, Disk_sale_Pairs=?, Disk_Closing_Stock=?, No_Of_Bills=?, NPS_Score=?, order=?, fulfilled=? where storeID='"+storeId+"' AND Date='"+date+"'";
	pstmt=con.prepareStatement(query1);
	pstmt.setString(1,LY_Pairs);
	pstmt.setString(2,Pairs_EST);
	pstmt.setString(3,Pairs_ACT);
	pstmt.setString(4,LY_Turnover);
	pstmt.setString(5,Turnover_EST);
	pstmt.setString(6,Turnover_ACT);
	pstmt.setString(7,NFT_Sale_Turnover);
	pstmt.setString(8,NFT_Percent);
	pstmt.setString(9,Margin);
	pstmt.setString(10,UPT_EY);
	pstmt.setString(11,UPT_TY);
	pstmt.setString(12,Laches_Handbag_PCS);
	pstmt.setString(13,Disk_Opening_Stock);
	pstmt.setString(14,Disk_sale_Pairs);
	pstmt.setString(15,Disk_Closing_Stock);
	pstmt.setString(16,No_Of_Bills);
	pstmt.setString(17,NPS_Score);
	pstmt.setString(18,order_no);
	pstmt.setString(19,fulfilled);	
	pstmt.executeUpdate();
	response.sendRedirect("dispDailySaleReport.jsp");
}

%>