<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Developer Home.</title>
</head>
<body>
	<h1> Welcome ${user}</h1>
	
	<div>
		<table width = 100% height = 100% border = "2">
				<tr>
					<form:form method="POST" action = "/issue-tracker/task/viewAssignedTasks/${user }">
						<td width = 35% valign = "middle" align = "center">
						<h3> Click here to view all assigned tasks.</h3>
						<img src = "assigned_tasks.jpg" alt = "Assigned Tasks" height = 50 width = 50 />
						<br> <br>
						<input type = "submit" value = "View all Tasks" />
						</td>
					</form:form>
					
					<form:form method = "POST" action = "/issue-tracker/task/issues">
						<td width = 35% valign = "middle" align = "center">
						<h3> Click here to view all issues in project.</h3>
						<img src = "issues.jpg" alt = "Issues " height = 50 width = 50 />
						<br> <br>
						<input type = "submit" value = "View all Issues" />
						</td>
					</form:form>
					
				</tr>
		</table>
	</div>
	
	
</body>
</html>