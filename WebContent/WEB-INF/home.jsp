<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../all_pages.css">
<style type="text/css">
body {
	margin: 0px
}

#home-container {
	background-color: #2c3e50;
	position: absolute;
	height: 100%;
	width: 100%;
}

#nav-links-container {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	height: 70px;
	background-color: #333;
}

.nav-links {
	float: left;
}

.nav-link {
	display: block;
	color: white;
	text-align: center;
	padding: 26px 16px;
	text-decoration: none;
}

.nav-link:hover {
	background-color: #111;
}

#login-container {
	height: 400px;
	width: 350px;
	background-color: #ecf0f1;
	border-radius: 10px;
	box-shadow: 7px 4px 124px -3px rgba(0, 0, 0, 0.61);
	margin-top: 4%;
	margin-left: 60%;
}

.usrnm-pswd {
	width: 250px;
	height: 35px;
	border-radius: 10px;
	text-align: center;
	margin: 50px 0 0 45px;
}
#forgot-pswd{
font-size: small;
text-decoration: blink;
margin-left:40px;
padding:50px;
}
</style>
<title>ARIJ</title>
</head>
<body>
	<div id="home-container">
		<div id="nav-bar">
			<ul id="nav-links-container">
				<li class="nav-links"><a href="#home" class="nav-link">Home</a></li>
				<li class="nav-links"><a href="#Projects" class="nav-link">Projects</a></li>
				<li class="nav-links"><a href="#SignOut" class="nav-link">Sign Out</a></li>
			</ul>
		</div>
		<div id="login-container">
			<form:form method = "POST" action = "/issue-tracker/login/validateUser" >
				<!--   <input class="usrnm-pswd" type="text" placeholder="Username" /> 
				<input class="usrnm-pswd" type="password" placeholder="Password" />
				<button action="submit" class="usrnm-pswd">Sign In!</button><br>-->
				
				<form:input path = "userName" class= "usrnm-pswd" placeholder = "Username" />
				<form:password path = "password" class= "usrnm-pswd" placeholder = "Password" />
				<input type = "submit" value = "Sign In" class="usrnm-pswd" />
				
				<br> <br> <br>
				<a id ="forgot-pswd" href="#forgot_pswd">Problems Signing In? Click Here!</a>
			</form:form>
		</div>
	</div>
</body>
</html>