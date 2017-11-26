<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Task</title>

<style type="text/css">
body {
	margin: 0px
}

#view-all-taks-container {
	background-color: #2c3e50;
	position: absolute;
	height: 100%;
	width: 100%;
	position: absolute;
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
#view-all-tasks-table {
	margin-top: 30px;
	position: relative;
	border-collapse: collapse;;
	border: 1px solid black;
	border-collapse: collapse;
	margin-left: 5%;
	width: 90%;
	border-radius: 2px;
	box-shadow: 7px 4px 124px -3px rgba(0, 0, 0, 0.61);
}
th, td {
	text-align: center;
	vertical-align: middle;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #ecf0f1
}

th {
	background-color: #27ae60;
	color: white;
}

.btn {
	background: #3498db;
	background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
	background-image: -moz-linear-gradient(top, #3498db, #2980b9);
	background-image: -ms-linear-gradient(top, #3498db, #2980b9);
	background-image: -o-linear-gradient(top, #3498db, #2980b9);
	background-image: linear-gradient(to bottom, #3498db, #2980b9);
	-webkit-border-radius: 28;
	-moz-border-radius: 28;
	border-radius: 28px;
	font-family: Arial;
	color: #ffffff;
	font-size: 10px;
	padding: 10px 20px 10px 20px;
	text-decoration: none;
}

.btn:hover {
	background: #cfdde6;
	background-image: -webkit-linear-gradient(top, #cfdde6, #09456e);
	background-image: -moz-linear-gradient(top, #cfdde6, #09456e);
	background-image: -ms-linear-gradient(top, #cfdde6, #09456e);
	background-image: -o-linear-gradient(top, #cfdde6, #09456e);
	background-image: linear-gradient(to bottom, #cfdde6, #09456e);
	text-decoration: none;
}
</style>

</head>
<body bgcolor="#3498db">
<div id="nav-bar">
			<ul id="nav-links-container">
				<li class="nav-links"><a href="home.jsp" class="nav-link">Home</a></li>
				<li class="nav-links"><a href="#Projects" class="nav-link">Projects</a></li>
				<li class="nav-links"><a href="#SignOut" class="nav-link">Sign
						Out</a></li>
			</ul>
</div>
<br> <br>
	<form:form method = "POST" action = "createTask">
		
		<form:label path = "taskName"> Task Name </form:label>
		<form:input path="taskName" required = "true" placeholder = "Task Name"/>
		<br> <br>
		
		<form:label path = "taskCreatedBy"> Assignee: </form:label>
		<form:input path="taskCreatedBy" required= "true" placeholder = "Enter your username"/>
		<br> <br>
		
		<form:label path="taskAssignedTo"> Assigned To: </form:label>
		<form:input path="taskAssignedTo" placeholder = "Enter username of assigned person"/>
		<br> <br>
		
		<form:label path = "taskType"> Task Type:  </form:label>
		<form:select path="taskType">
			<form:option value = "story point"> </form:option>
			<form:option value = "issue"> </form:option>
		</form:select>
		<br> <br>
		
		<form:label path = "status"> Status </form:label>
		<form:select path = "status">
			<form:option value="Open"></form:option>
			<form:option value="In progress"></form:option>
			<form:option value="Development"></form:option>
			<form:option value="Testing"></form:option>
			<form:option value="Closed"></form:option>
		</form:select>
		<br> <br>
		
		<input type = "submit" value = "Create Task" />
	</form:form>
</body>
</html>