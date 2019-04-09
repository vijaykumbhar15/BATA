<%@page import="org.sv.dto.TodayDate"%>
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
	<script src="css/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="css/style.css">
<title>Weekly Sale Report</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="showStoreManagerForm.jsp ">Back</a></li>
    </ul>
  </div>
</nav>
<div class="container" style="padding-top: 60px;">
	<form action="weeklySaleReport" method="post">
	 <h2>Weekly Sale Report</h2><br><br>
	<div class="form-group col-sm-6">
     <select class="form-control" name="storeID" required>
			<%
			
				System.out.println("Store ID"+request.getSession().getAttribute("storeId")+" Date from = "+request.getSession().getAttribute("dateFrom")+" DateTo = "+request.getSession().getAttribute("dateTo"));
			
				String storeManagerID=session.getAttribute("userID").toString();
			
				System.out.println("Store Manager ID = "+storeManagerID);
				
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					System.out.println("select * from storemaster where SM_ID='"+storeManagerID+"'");
					ResultSet rs= stmt.executeQuery("select * from storemaster where SM_ID='"+storeManagerID+"'");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("storeID")%>"><%=rs.getString("storename")%></option>
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
		</div>
		
		<%
			Connection con=DBConnection.getConnection();
			String todayDate = TodayDate.getDateYMD();
			Statement stmt=con.createStatement();
			System.out.println("SELECT weekNo FROM dsrcalendar where dateMatch='"+todayDate+"'");
			ResultSet rs2 = stmt.executeQuery("SELECT weekNo FROM dsrcalendar where dateMatch='"+todayDate+"'");
			rs2.next();
		
		%>
		
		<div class="form-group col-xs-4">
      <input type="text" class="form-control" id="week" name="week" value="<%=rs2.getString("weekNo")%>" required>
    </div>
		    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="lyPairs" placeholder="Pairs LY" name="lyPairs" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="estPairs" placeholder="Pairs EST" name="estPairs" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="actPairs" placeholder="Pairs ACT" name="actPairs" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="lyTurnover" placeholder="Turnover LY" name="lyTurnover" required>
 
      
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="estTurnover" placeholder="Turnover EST" name="estTurnover" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="actTurnover" placeholder="Turnover ACT"  name="actTurnover" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="nftSaleTurnover" placeholder="NFT Sale Turnover" name="nftSaleTurnover" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="nftPercent" placeholder="NFT %" name="nftPercent" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="margin" placeholder="Margin" name="margin" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="uptEy" placeholder="UPT LY" name="uptEy" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="uptTy" placeholder="UPT TY" name="uptTy" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="lachesHandbagPCS" placeholder="Ladies Handbag PCS" name="lachesHandbagPCS" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="diskOpeningStock" placeholder="Disc Opening Stock" name="diskOpeningStock" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="disckSalePairs" placeholder="Disc Sale Pairs" name="disckSalePairs" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="diskClosingStock" placeholder="Disc Closing Stock" name="diskClosingStock" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="noOfBills" placeholder="No Of Bills" name="noOfBills" required>
    </div>
    <div class="form-group col-xs-4">
		<select name="impressoUpdate" class="form-control" required>
			<option>--Select--</option>
			<option value="yes">Yes</option>
			<option value="no">No</option>
		</select>
	 </div>
	 <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="npsScore" placeholder="NPS Score" name="npsScore" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="order_No" placeholder="Order" name="order_No" required>
    </div>
     <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="fulfilled" placeholder="Fulfilled" name="fulfilled" required>
    </div>
    
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="NA" placeholder="NA" name="NA" disabled="disabled">
    </div>
		<br><br><br><button type="submit">Submit</button>	
			<button type="reset" name="clear" value="Clear">Clear</button>
			<button type="button" name="cancel" value="Cancel" onClick="window.location='showStoreManagerForm.jsp';">Cancel</button>  
	</form>
</div>
</body>
</html>