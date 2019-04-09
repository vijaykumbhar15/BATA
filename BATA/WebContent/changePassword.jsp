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

	<script type="text/javascript">
		function sub()
		{
			var oldPassword = document.getElementById('oldPassword').value;
			var newPassword = document.getElementById('newPassword').value;
			var reEnterPassword = document.getElementById('reEnterPassword').value;
			
			if(oldPassword =='')
			{			
				alert("Please Enter the old password");
				return false;
			}
			else if(newPassword!=reEnterPassword)
			{
				alert("New Password and Re-Entered password must be the same..!!!");
				return false;
			}
			else
			{
				return true;
			}
		}
	</script>	

<title>Daily Sale Report</title>
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
	<form action="ChangePassword" method="post">
	 <h2>Change Password</h2><br><br>
	
		    <div class="form-group col-xs-4">
      <input type="password" class="form-control" id="oldPassword" placeholder="Old Password" name="oldPassword" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="password" class="form-control" id="newPassword" placeholder="New Password" name="newPassword" required>
    </div>
    <div class="form-group col-xs-4">
      <input type="password" class="form-control" id="reEnterPassword" placeholder="Re-Enter New Password" name="reEnterPassword" required>
    </div>
    
		
		<br><br><br><input type="submit" onclick="sub()" value="Submit"/>
			<button type="reset" name="clear" value="Clear">Clear</button>
			<button type="button" name="cancel" value="Cancel" onClick="window.location='showStoreManagerForm.jsp';">Cancel</button> 
			<br><span style="color:red" name="resultOldPassword" id="resultOldPassword"><%=session.getAttribute("resultOldPassword")%></span>
	</form>
</div>
</body>
