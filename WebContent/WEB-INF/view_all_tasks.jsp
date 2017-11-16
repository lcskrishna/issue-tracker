<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Tasks</title>
</head>
<body>
	<table width=100% height=100% border=2>

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
				<input type = "submit" value = "Assign Task" />
			</td>

		</form:form>
		</tr>

		</c:forEach>
	</table>

</body>
</html>