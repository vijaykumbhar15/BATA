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
<title>Create New Employee</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="showAdminPage.jsp">Back</a></li>
    </ul>
  </div>
</nav>
<div class="container" style="padding-top: 40px;">
	<form action="createNewEmployee" method="post">
	<div class="form-group"> 
	<h2 align="center">Add New Employee</h2>
	<br><br>
       <input type="text" class="form-control" name="empID" placeholder="Employee ID" required/>
  	</div>
  	<div class="form-group"> 
       <input type="text" class="form-control" name="fName" placeholder="First Name" required/>
  	</div>
  	<div class="form-group"> 
       <input type="text" class="form-control" name="lName" placeholder="Last Name" required/>
  	</div>
  	<div class="form-group"> 
      <select name="designation" class="form-control" required>
		<option value="Store_Manager">Store_Manager</option>
		<option value="District_Manager">District_Manager</option>
		<option value="Regional_Manager">Regional_Manager</option>
	  </select>
  	</div>
  	<div class="form-group"> 
       <input type="password" class="form-control" name="password" placeholder="Password" required/>
  	</div>
  	<div class="form-group"> 
       <input type="text" class="form-control" name="mobileNo" placeholder="Mobile No" required/>
  	</div>
  	<div class="form-group"> 
       <input type="date" name="birthDate" id="birthDate" class="form-control" required>
			<script>
				var dt=document.getElementsByName("birthDate").valueAsDate = new Date();
				var sdt=dt.toString();
				console.log(sdt);
			</script> 
  	</div>
	
		<br><br><button type="submit">ADD Employee</button>
		<button type="reset" name="clear" value="Clear">Clear</button>
		<button type="button" name="cancel" value="Cancel" onClick="window.location='showAdminPage.jsp';">Cancel</button>
		
		</form>
	</div>
	
</div>
</body>
</html>