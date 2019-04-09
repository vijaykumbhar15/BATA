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
<title>Day Store Sale</title>
</head>
<body>
	
	<h3 align="left"><a href="index.jsp">Home</a></h3>
	<form action="dayStoreSale" method="post">
		<h4 align="center">Day Sale Entry</h4>
		<br><br>Store ID : <select class="form-control" name="storeID" onchange="">
			<option value="0">--Select Store--</option>
			<%
				try
				{
					Connection con=DBConnection.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs= stmt.executeQuery("select * from storemaster");
					while(rs.next())
					{
						%>
						<option value="<%=rs.getString("storeID")%>"><%=rs.getString("storeName")%></option>
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
			<p>Date : <span id="datetime"></span></p>
			<script>
				var dt = new Date();
				document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
			</script>
			
			LY Pairs : <input type="text" name="lyPairs"/>
			<br><br>Pairs EST : <input type="text" name="estPairs"/>
			<br><br>Pairs ACT : <input type="text" name="actPairs"/>
			<br><br>LY Turnover : <input type="text" name="lyTurnover"/>
			<br><br>Turnover EST : <input type="text" name="estTurnover"/>
			<br><br>Turnover ACT : <input type="text" name="actTurnover"/>
			<br><br>NFT Sale Turnover : <input type="text" name="nftSaleTurnover"/>
			<br><br>NFT % : <input type="text" name="nftPercent"/>
			<br><br>Margin : <input type="text" name="margin"/>
			<br><br>UPT EY : <input type="text" name="uptEy"/>
			<br><br>UPT TY : <input type="text" name="uptTy"/>
			<br><br>Laches Handbag PCS : <input type="text" name="lachesHandbagPCS"/>
			<br><br>Disk Opening Stock : <input type="text" name="diskOpeningStock"/>
			<br><br>Disk sale Pairs : <input type="text" name="disckSalePairs"/>
			<br><br>Disk Closing Stock : <input type="text" name="diskClosingStock"/>
			<br><br>No Of Bills : <input type="text" name="noOfBills"/>
			<br><br>NPS Score : <input type="text" name="npsScore"/>
			<br><br>Impresso Update : <select name="impressoUpdate">
											<option>--Select--</option>
											<option value="yes">Yes</option>
											<option value="no">No</option>
										</select>
										
			<br><br><input type="Submit" name="save" value="Save"></input>
			<input type="button" name="edit" value="Edit"></input>
			<input type="button" name="clear" value="Clear"></input>
			<input type="button" name="cancel" value="Cancel"></input> 
			
			
				
	
	</form>

</body>
</html>