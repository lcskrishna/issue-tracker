<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Tasks</title>
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
<body>
<div id="view-all-taks-container">
<div id="nav-bar">
			<ul id="nav-links-container">
				<li class="nav-links"><a href="#home" class="nav-link">Home</a></li>
				<li class="nav-links"><a href="#Projects" class="nav-link">Projects</a></li>
				<li class="nav-links"><a href="#SignOut" class="nav-link">Sign
						Out</a></li>
			</ul>
</div>
	<table id="view-all-tasks-table">

		<tr>
			<th>Task ID </th>
			<th>Task Name</th>
			<th>Task Type</th>
			<th>Task Created By</th>
			<th>Task Assigned To</th>
			<th>Status</th>
		</tr>

		<c:forEach items="${tasks}" var = "listValue">
		<tr>
		<form:form method = "POST" action = "/issue-tracker/task/assignTask">
		
			<td align = "center">
				<form:input path = "taskId" required = "true" value = "${listValue.taskId }" />
			</td>
		
			<td align="center">
				<form:input path="taskName" required="true"	value="${listValue.taskName }" />
			</td>
			
			<td align="center">
				<form:input path="taskName" required="true"	value="${listValue.taskType }" />
			</td>

			<td align="center">
				<form:input path="taskCreatedBy" required="true"	value="${listValue.taskCreatedBy }" />
			</td>

			<td align="center">
				<form:input path="taskAssignedTo" required= "true" value="${listValue.taskAssignedTo }" />
			</td>

			<td align="center">
				<form:input path="status" required= "true" value="${listValue.status }" />
			</td>
			
			<td align = "center">
				<input class="btn"  type = "submit" value = "Assign Task" />
			</td>

		</form:form>
		</tr>

		</c:forEach>
	</table>
</div>
</body>
</html>