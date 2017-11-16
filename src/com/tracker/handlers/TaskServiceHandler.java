package com.tracker.handlers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tracker.databaseconnections.ConnectionUtil;
import com.tracker.models.Task;

public class TaskServiceHandler {
	
	private Connection conn;
	private Statement stmt;
	
	public String createTask(Task task) {
		
		try {
			conn = ConnectionUtil.connectToDb();
			stmt = conn.createStatement();
			
			String sql = "INSERT INTO TASK_TABLE (TASKID, TASKNAME, TASKTYPE, TASKCREATEDBY, TASKASSIGNEDTO, DATE, STATUS) VALUES (  "
					+ task.getTaskId() + ", ' "
					+ task.getTaskName() + "', '"
					+ task.getTaskType() + "', '"
					+ task.getTaskCreatedBy() + "', '"
					+ task.getTaskAssignedTo() + "', '"
					+ task.getDate() + "', '" 
					+ task.getStatus() + "' );";
			
			System.out.println("DEBUG: SQL query for create task is : ");
			System.out.println(sql);
			stmt.executeUpdate(sql);
			
			System.out.println("INFO: Task has been successfully created : " + task.toString());
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("ERROR: Failure in creating the task.");
			e.printStackTrace();
		}finally {
			closeStatement();
		}
		
		return task.getTaskId();
	}
	
	public boolean assignTaskToUser(String taskId, String userName) {
		boolean isAssigned= false;
		
		try {
			conn = ConnectionUtil.connectToDb();
			stmt = conn.createStatement();
			
			String sql = "UPDATE TASK_TABLE SET TASKASSIGNEDTO = '" + userName + "' WHERE TASKID = '" + taskId + "';";
			System.out.println("DEBUG: Assign Task to a user SQL : " + sql);
			
			stmt.executeUpdate(sql);
			isAssigned = true;
			System.out.println("INFO: Task has been successfully assigned to the user.");
			
		}catch(Exception e) {
			System.out.println("ERROR: Failure in assigning the task to the user.");
			e.printStackTrace();
		}finally {
			closeStatement();
		}
		
		return isAssigned;
	}
	
	public boolean updateStatusOfTask(String status, String taskId) {
		boolean isUpdated = false;
		
		try {
			conn = ConnectionUtil.connectToDb();
			stmt = conn.createStatement();
			
			String sql = "UPDATE TASK_TABLE SET STATUS = '" + status + "' WHERE TASKID = '" + taskId + "';";
			System.out.println("DEBUG: Update Status SQL : " + sql);
			
			stmt.executeUpdate(sql);
			isUpdated = true;
			
			System.out.println("INFO: Status has been successfully updated.");
			
		}catch(Exception e) {
			System.out.println("ERROR: Unable to update the status of the task.");
			e.printStackTrace();
		}finally {
			closeStatement();
		}
		
		return isUpdated;
	}
	
	public List<Task> getAllTasks() {
		List<Task> tasks = new ArrayList<Task>();
		
		try {
			conn = ConnectionUtil.connectToDb();
			stmt = conn.createStatement();	
			
			String sql = "SELECT * FROM TASK_TABLE;";
			System.out.println("DEBUG: Get all Tasks SQL : " + sql);
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Task task = createTaskItem(rs);
				tasks.add(task);
			}
			
			System.out.println("INFO: The number of tasks retrieved are: " + tasks.size());
			
		} catch(Exception e) {
			System.out.println("ERROR: Unable to retrieve all the tasks.");
		} finally {
			closeStatement();
		}
		
		return tasks;
	}
	
	public List<Task> getAllTasksAssignedToUser(String userName) {
		
		List<Task> tasksAssigned = new ArrayList<Task>();
		
		try {
			conn = ConnectionUtil.connectToDb();
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM TASK_TABLE WHERE TASKASSIGNEDTO = '" + userName + "';";
			System.out.println("DEBUG: Tasks assigned to user SQL : " + sql);
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Task task = createTaskItem(rs);
				tasksAssigned.add(task);
			}
			
			System.out.println("INFO: Number of tasks assigned to the user : " + tasksAssigned.size());
			
		} catch(Exception e) {
			System.out.println("ERROR: Unable to retrieve tasks assigned to the user :" + userName);
			e.printStackTrace();
		} finally {
			closeStatement();
		}
		
		return tasksAssigned;
	}
	
	public List<Task> getAllIssues() {
		
		List<Task> issues = new ArrayList<Task>();
		
		try {
			conn = ConnectionUtil.connectToDb();
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM TASK_TABLE WHERE TASKTYPE = 'issue';";
			System.out.println("DEBUG: Get all issues SQL : " + sql);
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Task task = createTaskItem(rs);
				issues.add(task);
			}
			
			System.out.println("INFO: Number of issues found: " + issues.size());
			
		}catch(Exception e) {
			System.out.println("ERROR: Unable to retrieve issues.");
			e.printStackTrace();
		}
		
		return issues;
	}

	private Task createTaskItem(ResultSet rs) throws SQLException {
		Task task = new Task();
		task.setTaskId(rs.getString("TASKID"));
		task.setTaskName(rs.getString("TASKNAME"));
		task.setTaskCreatedBy(rs.getString("TASKCREATEDBY"));
		task.setTaskAssignedTo(rs.getString("TASKASSIGNEDTO"));
		task.setTaskType(rs.getString("TASKTYPE"));
		task.setDate(rs.getString("DATE"));
		task.setStatus(rs.getString("STATUS"));
		
		return task;
	}

	private void closeStatement() {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		}
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
}
