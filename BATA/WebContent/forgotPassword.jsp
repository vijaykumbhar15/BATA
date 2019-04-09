<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Forgot Password</title>
	</head>
	<body>
	
		<script type="text/javascript">
			
			function validation() {
				
				var empID = fPassword.employeeID.value;
				
				var newPass = fPassword.newPassword.value;
				var newConfirmPassword = fPassword.newConfirmPassword.value;
				
				var dt=fPassword.birthDate.valueAsDate = new Date();
				var birthDate=dt.toString();
			
				if(empID=="")
				{
					alert("Please provide the Employee ID");
					return false;	
				}
				if(birthDate=="")
				{
					alert("Please provide the Birth Date");
					return false;	
				}
				if(newPass=="")
				{
					alert("Please provide the password");
					return false;	
				}
				if(newConfirmPassword=="")
				{
					alert("Please provide the password");
					return false;	
				}
				 
				if(newPass!=newConfirmPassword)
				{
					alert("Please provide the same password");
					return false;
				}
			}
			
			
		</script>
	
		<form action="ForgotPassword" method="post" name="fPassword">
		
			<div class="form-group"> 
	        	<input type="text" class="form-control" name="employeeID" placeholder="Employee ID" />
	  		</div>
	  		
	  		<div class="form-group"> 
	       		<input type="date" name="birthDate" id="birthDate" class="form-control">
				<script>
					var dt=document.getElementsByName("birthDate").valueAsDate = new Date();
					var sdt=dt.toString();
					console.log(sdt);
				</script> 
	  		</div>
	  		
	  		<div class="form-group"> 
	        	<input type="text" class="form-control" id="newPassword" name="newPassword" placeholder="Enter New Password " />
	  		</div>
	  		
	  		<div class="form-group"> 
	        	<input type="text" class="form-control" id="newConfirmPassword" name="newConfirmPassword" placeholder="Confirm New Passowrd" />
	  		</div>
	  				
			<br><br><button type="submit" onclick="return validation();">Update Password</button>
		
		</form>
		
	</body>
</html>