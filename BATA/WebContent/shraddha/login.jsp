<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="style.css">
<title>Login Window</title>
</head>
<body>

<nav class="navbar navbar-primary">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp">Company Name</a>
    </div>
  </div>
</nav>
   

<div class="container">
  <form action="loginServlet">
  <div class="col-sm-6"> 
       <img src="https://colorlib.com/etc/lf/Login_v1/images/img-01.png">
  </div>
    <div class="form-group col-sm-6">
      <h2>Login Form</h2>
    <br><br>
      <input type="text" class="form-control" id="userName" placeholder="Enter Name" name="userName">
    </div>
    <div class="form-group col-sm-6">
      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
    </div>
    
    <input type="submit" class="btn btn-success">
     <a href="registerNewUser.jsp">Register New user</a>
    
    
    
  </form>
</div>
</body>
</html>