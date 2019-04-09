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
<title>Add New Store Manager</title>
</head>
<body onload="noBack();">

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
<div class="container" style="padding-top: 100px;">
<form action="addNewStoreManager" method="post">
	<div class="form-group"> 
	<h2 align="center">Add New Store Manager</h2>
	<br><br>
       <input type="text" class="form-control" name="empID" placeholder="Store Manager ID" required />
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
	
  	
	<button type="submit">ADD</button>
	<button type="reset" name="Clear" value="Clear">Clear</button>
	<button type="button" name="Cancle" value="Cancle" onClick="window.location='showDistrictManagerForm.jsp';">Cancel</button>
	
	</form>
</div>

</body>
</html>