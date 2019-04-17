<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.sv.dto.DBConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
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
<title>Projection Entry</title>

<script type="text/javascript">
 
function weekLYCalculation() {
	console.log("In weekLYCalculation");
	weekLY = parseFloat(document.getElementById("monLY").value) + parseFloat(document.getElementById("tueLY").value)+parseFloat(document.getElementById("wedLY").value)+parseFloat(document.getElementById("thuLY").value)+parseFloat(document.getElementById("friLY").value)+parseFloat(document.getElementById("satLY").value)+parseFloat(document.getElementById("sunLY").value);
	document.getElementById("weeklyLY").value=weekLY;
}
function weekESTCalculation() {
	console.log("In weekLYCalculation");
	weekEST = parseFloat(document.getElementById("monETS").value) + parseFloat(document.getElementById("tueETS").value)+parseFloat(document.getElementById("wedETS").value)+parseFloat(document.getElementById("thuETS").value)+parseFloat(document.getElementById("friETS").value)+parseFloat(document.getElementById("satETS").value)+parseFloat(document.getElementById("sunETS").value);
	document.getElementById("weeklyETS").value=weekEST;
}

function weekPROJCalculation() {
	console.log("In weekLYCalculation");
	weekPROJ = parseFloat(document.getElementById("monPROJ").value) + parseFloat(document.getElementById("tuePROJ").value)+parseFloat(document.getElementById("wedPROJ").value)+parseFloat(document.getElementById("thuPROJ").value)+parseFloat(document.getElementById("friPROJ").value)+parseFloat(document.getElementById("satPROJ").value)+parseFloat(document.getElementById("sunPROJ").value);
	document.getElementById("weeklyPROJ").value=weekPROJ;
}

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
	
	todayDate = mm + '/' + dd + '/' + yyyy;

	document.getElementById("datetime").value = todayDate;
}
</script>

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
	
	<form action="ProjectionEntry" method="post" >
	
	
	 <h2>Projection Entry</h2><br><br>
	<div class="form-group col-sm-6">
	<select class="form-control" name="storeID" onchange="" required>
		<!-- <option value="0">--Select Store--</option> -->
		<%
			String storeManagerID=session.getAttribute("userID").toString();
		
			System.out.println("Store Manager ID = "+storeManagerID);
		
			try
			{
				Connection con=DBConnection.getConnection();
				Statement stmt=con.createStatement();
				//ResultSet rs= stmt.executeQuery("SELECT * FROM myfirstappdb.storemaster");
				ResultSet rs= stmt.executeQuery("select * from storemaster where SM_ID='"+storeManagerID+"'");
				while(rs.next())
				{
					%>
					<option value="<%=rs.getString("storeID")%>"><%=rs.getString("storeName")%></option>
					<%
				}
				con.close();
				stmt.close();
				rs.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		%>
		</select></div>
		
		
		<div class="form-group col-sm-6">
			
			<%
			
			try
			{
				
				//Getting the WEEK NO from database table
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				String todayDate = dateFormat.format(date);
				System.out.println("Today date is"+dateFormat.format(date)+" in Projection Entry");
        		
				Connection con=DBConnection.getConnection();
				Statement stmt=con.createStatement();
				
				System.out.println("SELECT weekNo FROM dsrcalendar where dateMatch = '"+todayDate+"'");
				ResultSet rs= stmt.executeQuery("SELECT weekNo FROM dsrcalendar where dateMatch = '"+todayDate+"'");
				while(rs.next())
				{
					%>
					<input type="text" class="form-control" name="weekNo" value="<%=rs.getString("weekNo")%>" disabled="disabled"/>
					<%
				}
				con.close();
				stmt.close();
				rs.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		%>
		</div>
		
		<div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="monLY" name="monLY" placeholder="Monday LY" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="monETS"  name="monETS" placeholder="Monday ETS" onchange="weekESTCalculation()"  required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="monPROJ" name="monPROJ" placeholder="Monday Projection" onchange="weekPROJCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="tueLY" name="tueLY" placeholder="Tuesday LY" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="tueETS" name="tueETS" placeholder="Tuesday ETS" onchange="weekESTCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="tuePROJ" name="tuePROJ" placeholder="Tuesday Projection" onchange="weekPROJCalculation()" required/>
	    </div>
	   <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="wedLY" name="wedLY" placeholder="Wednesday LY" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="wedETS"  name="wedETS" placeholder="Wednesday ETS" onchange="weekESTCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="wedPROJ"  name="wedPROJ" placeholder="Wed Projection" onchange="weekPROJCalculation()" required/>
	    </div>
	     <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="thuLY"  name="thuLY" placeholder="Thursday LY" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="thuETS"  name="thuETS" placeholder="Thursday ETS" onchange="weekESTCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="thuPROJ"  name="thuPROJ" placeholder="Thu Projection" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="friLY"  name="friLY" placeholder="Friday LY" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="friETS"  name="friETS" placeholder="Friday ETS" onchange="weekESTCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="friPROJ" name="friPROJ" placeholder="Fri Projection" onchange="weekPROJCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="satLY" name="satLY" placeholder="Saturday LY" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="satETS" name="satETS" placeholder="Saturday ETS" onchange="weekESTCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="satPROJ" name="satPROJ" placeholder="Sat Projection" onchange="weekPROJCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="sunLY" name="sunLY" placeholder="Sunday LY" onchange="weekLYCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="sunETS" name="sunETS" placeholder="Sunday ETS" onchange="weekESTCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="sunPROJ" name="sunPROJ" placeholder="Sunday Projection" onchange="weekPROJCalculation()" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      
	      <input type="number" class="form-control" id="weeklyLY" name="weeklyLY" placeholder="Weekly LY" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="weeklyETS" name="weeklyETS" placeholder="Weekly ETS" required/>
	    </div>
	    <div class="form-group col-xs-4">
	      <input type="number" class="form-control" id="weeklyPROJ" name="weeklyPROJ" placeholder="Weekly Projection" required/>
	    </div>
	   
		<br><br><br><button type="submit">Submit</button>
		<button type="reset" name="clear" value="Clear">Clear</button>
			<button type="button" name="cancel" value="Cancel" onClick="window.location='showStoreManagerForm.jsp';">Cancel</button> 
	</form>
	</div>
</body>
</html>