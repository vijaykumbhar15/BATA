<%@page import="org.sv.dto.TodayDate"%>
<%@page import="org.apache.poi.ss.formula.functions.Today"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.sv.dto.DBConnection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function setDate(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd = '0'+dd
	} 

	if(mm<10) {
	    mm = '0'+mm
	} 
	
	todayDate = yyyy + '-' + mm + '-' + dd;

	document.getElementById("datetime").value = todayDate;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="css/jquery.min.js"></script>
	<script src="css/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="css/style.css">
<title>Daily Sale Report</title>
</head>
<body onload="setDate()">
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
	<form action="dailySaleReport" method="post">
	 <h2>Daily Sale Report</h2><br><br>
	<div class="form-group col-sm-6">
     <select class="form-control" name="storeID" required>
			<!-- <option value="0">--Select Store--</option> -->
			<%
				String storeManagerID=session.getAttribute("userID").toString();
			
				System.out.println("Store Manager ID = "+storeManagerID);
				
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select * from storemaster where SM_ID='"+storeManagerID+"'");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("storeID")%>"><%=rs.getString("storeName")%></option>
						<%
					}
					con.close();
					rs.close();
					stmt.close();
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
			%>
		</select>    
		</div>
		<div class="form-group col-sm-6">
 			<!-- <input type="date" name="datetime" id="datetime" class="form-control" onload="getDate()" required> -->
 			<input type="text" name="datetime" id="datetime" class="form-control" onload="getDate()" required>
			
		</div>
		    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="lyPairs" placeholder="LY Pairs" name="lyPairs" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="estPairs" placeholder="Pairs EST" name="estPairs" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="actPairs" placeholder="Pairs ACT" name="actPairs" required>
    </div>
    <!-- <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="lyTurnover" placeholder="LY Turnover" name="lyTurnover" required>
    </div> -->
    
    <div class="form-group col-xs-4">
    	<input type="text" class="form-control" id="lyTurnover" placeholder="Turnover LY" name="lyTurnover" required>
    	<%-- <select class="form-control" name="lyTurnover" required>
			<option value="0">--Select LY Turnover--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					PreparedStatement pstm = con.prepareStatement("select * from projection_ly where storeID in (select storeid from storemaster where SM_ID=?)");
					
					System.out.println("Geeting the LY Projection");
					
					pstm.setString(1, session.getAttribute("userID").toString());
					
					ResultSet rs= pstm.executeQuery();
					
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("value")%>"><%=rs.getString("value")%></option>
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
		</select>    --%> 
	</div>
    
    <!-- <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="estTurnover" placeholder="Turnover EST" name="estTurnover" required>
    </div> -->
    
    <div class="form-group col-xs-4">
    	<input type="text" class="form-control" id="estTurnover" placeholder="Turnover EST" name="estTurnover" required>
    	<%-- <select class="form-control" name="estTurnover" required>
			<option value="0">--Select EST Turnover--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					
					PreparedStatement pstm = con.prepareStatement("select * from projection_est where storeID in (select storeid from storemaster where SM_ID=?)");
					System.out.println("Geeting the EST Projection");
					pstm.setString(1, session.getAttribute("userID").toString());
					
					ResultSet rs= pstm.executeQuery();
					
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("value")%>"><%=rs.getString("value")%></option>
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
		</select>     --%>
	</div>
    
    
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="actTurnover" placeholder="Turnover ACT" name="actTurnover" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="nftSaleTurnover" placeholder="NEFT Sale Turnover" name="nftSaleTurnover" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="nftPercent" placeholder="NEFT %" name="nftPercent" required>
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
			<option>--Real Picture Update?--</option>
			<option value="yes">Yes</option>
			<option value="no">No</option>
		</select>
	 </div>
	 		
	 <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="npsScore" placeholder="NPS Score" name="npsScore" required>
    </div>
     <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="order" placeholder="Order" name="order" required>
    </div>
     <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="fulfilled" placeholder="Fulfilled" name="fulfilled" required>
    </div>
    
    <div class="form-group col-xs-4">
      <input type="text" class="form-control" id="NA" placeholder="NA" name="NA" disabled="disabled">
    </div>
   <!--  <div class="form-group col-xs-4">
		<select name="rpu" class="form-control" required>
			<option>--Select--</option>
			<option value="yes">Yes</option>
			<option value="no">No</option>
		</select>
	 </div> -->
	 		<button type="submit" name="clear">Submit</button>	
			<button type="reset" name="clear" value="Clear">Clear</button>
			<button type="button" name="cancel" value="Cancel" onClick="window.location='showStoreManagerForm.jsp';">Cancel</button> 
		
			
	</form>
</div>
	

</body>
 <script>
		//To set the todays date in datetime
		
		function getDate()
		{
			console.log("Hello in getDate() function");
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();

			if(dd<10) {
			    dd = '0'+dd
			} 

			if(mm<10) {
			    mm = '0'+mm
			} 

			//today = mm + '/' + dd + '/' + yyyy;
			todayDate =  yyyy + '/' + mm + '/' + dd;
			
			//var dateControl = document.querySelector('input[type="date"]');
			//dateControl.value = today;
			
			//document.getElementById("datetime").value=today;
			
			document.getElementById("datetime").defaultValue =todayDate;
			
			//console.log("Date = "+document.getElementById("datetime").value);
		}
		
				
	</script> 
</html>