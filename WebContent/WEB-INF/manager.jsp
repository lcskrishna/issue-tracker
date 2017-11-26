<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../all_pages.css">
<link href="https://fonts.googleapis.com/css?family=Asul"
	rel="stylesheet">
<style type="text/css">
body {
	margin: 0px
}

#manager-home-container {
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

#issues_table {
	margin-top: 30px;
	position: relative;
	border-collapse: collapse;;
	border: 1px solid black;
	border-collapse: collapse;
	margin-left: 15%;
	width: 70%;
	border-radius: 2px;
	box-shadow: 7px 4px 124px -3px rgba(0, 0, 0, 0.61);
	background-color: #ecf0f1;
	padding: 30px;
}

#all-issues {
	height: 400px;
	width: 35%;
	vertical-align: "middle";
	text-align: center;
	background-color: #e74c3c;
	font-family: 'Asul', sans-serif;
	font-size: 30px;
}

#all-tasks {
	height: 400px;
	width: 35%;
	vertical-align: "middle";
	text-align: center;
	background-color: #16a085;
	font-family: 'Asul', sans-serif;
	font-size: 30px;
}

#create-task {
	height: 400px;
	width: 35%;
	vertical-align: "middle";
	text-align: center;
	background-color: #f39c12;
	font-family: 'Asul', sans-serif;
	font-size: 30px;
}

.button {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	padding: 12px 18px;
	border: 1px solid #2c3e50;
	border-radius: 50px;
	background: #2c3e50;
	background: -webkit-gradient(linear, left top, left bottom, from(#2c3e50),
		to(#2c3e50));
	background: -moz-linear-gradient(top, #ff4a4a, #992727);
	background: linear-gradient(to bottom, #ff4a4a, #992727);
	-webkit-box-shadow: #ff5959 0px 0px 40px 0px;
	-moz-box-shadow: #ff5959 0px 0px 40px 0px;
	box-shadow: #ff5959 0px 0px 40px 0px;
	text-shadow: #591717 1px 1px 1px;
	font: normal normal bold 20px georgia;
	color: #ffffff;
	text-decoration: none;
}

.button:hover, .button:focus {
	background: #2c3e50;
	background: -webkit-gradient(linear, left top, left bottom, from(#2c3e50),
		to(#2c3e50));
	background: -moz-linear-gradient(top, #2c3e50, #2c3e50);
	background: linear-gradient(to bottom, #2c3e50, #2c3e50);
	color: #ffffff;
	text-decoration: none;
}

.button:active {
	background: #2c3e50;
	background: -webkit-gradient(linear, left top, left bottom, from(#2c3e50),
		to(#982727));
	background: -moz-linear-gradient(top, #2c3e50, #2c3e50);
	background: linear-gradient(to bottom, #2c3e50, #2c3e50);
}
</style>
<title>ARIJ</title>
</head>
<body>
	<div id="manager-home-container">
		<div id="nav-bar">
			<ul id="nav-links-container">
				<li class="nav-links"><a href="#home" class="nav-link">Home</a></li>
				<li class="nav-links"><a href="#Projects" class="nav-link">Projects</a></li>
				<li class="nav-links"><a href="#SignOut" class="nav-link">Sign
						Out</a></li>
			</ul>

		</div>
		<h1 style = "color:white;">Welcome ${user}</h1>

		<div>
			<table width=100% height=100% border="2">
				<tr>
					<form:form method="POST" action="/issue-tracker/task/viewTasks">
						<td id="all-tasks">
							<h3>Click here to view all tasks.</h3> <img
							src="assigned_tasks.jpg" alt="View Tasks" height=50 width=50 />
							<br> <br> <input class="button" type="submit" value="View all Tasks" />
						</td>
					</form:form>

					<form:form method="POST" action="/issue-tracker/task/issues">
						<td id="all-issues">
							<h3>Click here to view all issues in project.</h3> <img
							src="issues.jpg" alt="Issues " height=50 width=50 /> <br> <br>
							<input class="button" type="submit" value="View all Issues" />
						</td>
					</form:form>

					<form:form method="GET" action="/issue-tracker/task/add_task">
						<td id="create-task">
							<h3>Click here to create task.</h3> <img src="create_task.jpg"
							alt="Create Task" height=50 width=50 /> <br> <br> <input
							class="button" type="submit" value="Create Task" />
						</td>
					</form:form>
				</tr>
			</table>
		</div>


	</div>

</body>
</html>