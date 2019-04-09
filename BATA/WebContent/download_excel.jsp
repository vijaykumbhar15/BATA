<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="downloadHoleWeekReport" method="post">
	
		<br><br>Enter Week No : <input type="text" name="weekNoTocheckReport">
		<br><br><input type="submit" name="getWeeklyReport" value="Get Weekly Report">
		
		<span name="downloadStatus"></span>
		
	
	</form>
	
</body>
</html>