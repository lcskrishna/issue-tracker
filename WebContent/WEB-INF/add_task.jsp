<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Task</title>
</head>
<body>
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