<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="css/jquery.min.js"></script>
	<script src="css/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/w3.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
 </script> -->
<title>Login Window</title>
</head>
	<body>
	
	<script type="text/javascript">
			
			function() {
				
				var userID = $('#userName').val();
				var userID = $('#password').val();
			
				if(userID=="")
				{
					alert("Please provide the User ID");
					return false;	
				}
				if(userID=="")
				{
					alert("Please provide the password");
					return false;	
				}
			
			}
		</script>

		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="index.jsp">DSR</a>
		    </div>
		    
		    <ul class="nav navbar-nav navbar-right">
		      <li><a href="index.jsp ">Home</a></li>
		    </ul>
		  </div>
		</nav>
	  

		<div class="container" style="padding-top: 135px;">
			  <form action="loginServlet" method="post">
				  <div class="col-sm-6"> 
				       <img class="user_img" src="img/login.png">
				  </div>
				  <div class="form-group col-sm-6">
				  	<h2>Login Form</h2>
				    <br><br>
				    	<input type="text" class="form-control" id="userName" placeholder="Enter ID" name="userName" required>
				  </div>
				  
				  <div class="form-group col-sm-6">
				      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
				  </div>
	    
	    		<!--   <button type="submit" name="btnLogin" id="btnLogin" onclick="return validation();">Login</button> -->
	    		<button type="submit" name="btnLogin" id="btnLogin" >Login</button>
	    		  <br><a href="forgotPassword.jsp">Forgot Password</a>
	    		  <br><span style="color:red" name="result" id="result"><%=session.getAttribute("result")%></span>
	    		  
	    		</form>
		</div>
		
		
	</body>
</html>