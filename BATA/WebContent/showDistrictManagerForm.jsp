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
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
 </script>
<title>District Manager Form</title>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
    
    <ul class="nav navbar-nav navbar-right">
      
      <li><a href="logout.jsp ">Logout</a></li>
    </ul>
  </div>
</nav>
 
<div class="container" style="padding-top: 90px;  width: 100%;"> 
<!-- <div class="container1"> -->
<form action="" class="from-group">
	<%
			System.out.println("Designation in District Manger form ="+session.getAttribute("designation"));
			
				
			if(session.getAttribute("userName")==null || !(session.getAttribute("designation").equals("District_Manager")))
			{
				System.out.println("In if loop User Name = "+session.getAttribute("userName")+" Designation = "+session.getAttribute("designation"));
				response.sendRedirect("login.jsp");
			}
			response.setHeader("Cache-Control", "no-cahce,no-store,must-revalidate"); 
			response.setHeader("Pragma", "no-cahce");
			response.setHeader("Expires", "0");
			
				
	%>
	<h2>Welcome <%=session.getAttribute("fName") %> <%=session.getAttribute("lName") %></h2>
	<br><br>
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='dispDailySaleReport.jsp';">Daily Sale Report</button>
		<button type="button" class="btn btn-default btn-wide" href="#"> Store-wise Weekly Report </button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='dispWeeklySaleReport.jsp';"> Weekly Report</button>
		
	</div>	
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='viewDistrictManagerProjection.jsp';">Weekly Store Projection</button>
		<button type="button" class="btn btn-default btn-wide" href="#">DM Achievement</button>
		<button type="button" class="btn btn-default btn-wide" href="#">District Wise YTD Report</button>
	</div>	
	
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" href="#">Add DM Projection</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='addStore.jsp';">Add New Store</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='addNewStoreManager.jsp';">Add New Store Manager</button>
	</div>
	<div class="col-sm-6">
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='showStoreDetails.jsp';">Update\Delete Store</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='showManagerDetails.jsp'">Update\Delete Manager</button>
		<button type="button" class="btn btn-default btn-wide" onClick="window.location='viewStoreDetails.jsp'">View Store Details</button>
	</div>	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</form>
	</div>
</body>
</html>