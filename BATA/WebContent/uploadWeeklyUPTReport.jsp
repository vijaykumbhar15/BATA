<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.sv.dto.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="css/jquery.min.js"></script>
	<script src="css/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="css/style.css">
	
	<script type="text/javascript">
		function sub()
		{
			var fileUpload = document.getElementById('file_upload').value;
			
			if(fileUpload =='')
			{
				alert("Please select the File to upload");
				return false;
			}
			else
			{
				var extension = fileUpload.substring(fileUpload.lastIndexOf('.')+1);
				if(extension == "pdf")
				{					
					document.forms[0].action="SaveWeeklyPDF";
					document.forms[0].method="POST";
					document.forms[0].enctype="multipart/form-data";
					document.forms[0].submit();
				}
				else
				{
					alert("Only pdf files are allowed");
					return false;
				}
				
			}
		}
	</script>
	
<title>Store Weekly Report</title>
</head>
	<body>
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="index.jsp">DSR</a>
		    </div>
		    <ul class="nav navbar-nav navbar-right">
		      <li><a href="showStoreManagerForm.jsp">Back</a></li>
		    </ul>
		  </div>
		</nav>
		<div class="container" style="padding-top: 60px;">
	
			<form action="" method="post" enctype="multipart/form-data">
			 <h2>Upload Weekly UPT Report</h2><br><br>
			<div class="form-group col-sm-6">
		     <select class="form-control" name="storeID">
					<option value="0">--Select Store--</option>
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
							stmt.close();
							rs.close();
						}
						catch(Exception e)
						{
							System.out.println(e);
						}
						
					%>
					</select>    
				</div>
				
				<div class="form-group col-sm-6">
		 			<input type="date" name="datetime_from" id="datetime" class="form-control" required>
					<script>
						var dt=document.getElementsByName("datetime").valueAsDate = new Date();
						var sdt=dt.toString();
						console.log(sdt);
					</script>   
				</div> 	
				<div class="form-group col-sm-6">
		 			<input type="date" name="datetime_to" id="datetime" class="form-control" required>
					<script>
						var dt=document.getElementsByName("datetime").valueAsDate = new Date();
						var sdt=dt.toString();
						console.log(sdt);
					</script>   
				</div> 	
				
				<input type="file" name="file_upload" accept="application/pdf" id="file_upload">
				
			<br><br><br><button type="button" onclick="sub()">Submit</button>	
			
					<button type="reset" name="clear" value="Clear">Clear</button>
					<button type="button" name="cancel" value="Cancel" onClick="window.location='showStoreManagerForm.jsp';">Cancel</button>
					
			</form>
		</div>
	</body>
</html>