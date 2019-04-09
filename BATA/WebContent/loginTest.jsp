<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">
			$(document).ready(function(){
				
				$('#btnLogin').submit(function(){
					
					$.ajax({
						url:'ServletLogin',
						type='POST',
						dataType:'json',
						data:$('#userName').serialize(),
						success:function(data){
							if(data.isvalid)
								return true;
							else
								alert("Please Enter a valid userID and Password");
						}
						
					});
					
					return false;
				});
				
			});
	</script>

</head>
<body>


	
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
	    
	    		  <button type="submit" name="btnLogin" id="btnLogin">Login</button>
	    		  <br><a href="forgotPassword.jsp">Forgot Password</a>
	    		  <br><span name="result" id="result"></span>
	    		  
	    		</form>
</body>
</html>