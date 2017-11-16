package testclient;

import java.util.Date;
import java.util.List;

import com.tracker.impl.TaskServiceImpl;
import com.tracker.models.Task;

public class Tester {
	public static void main(String[] args) {
/*		try {
			Connection conn = ConnectionUtil.connectToDb();
			if(conn != null ) {
				System.out.println("Successfully connected.");
			}
			else {
				System.out.println("Connection failure.");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		UserLogin user = new UserLogin();
		user.setUserName("chaitanya");
		user.setPassword("abcdef");
		user.setFirstName("Chaitanya");
		user.setLastName("Lolla");
		user.setEmailId("lollachaitanya@gmail.com");
		user.setRole("Developer");
		
		LoginServiceImpl impl = new LoginServiceImpl();
		//impl.registerUser(user);
		String isValid = impl.validateUserLogin(user);
		if(isValid != null) {
			System.out.println("Successful.");
		}
		else {
			System.out.println("Failure.. !!! ");
		}*/
		
		Task task = new Task();
		String taskId = String.valueOf(new Date().getTime());
		task.setTaskId(taskId);
		task.setTaskName("Hello world");
		task.setTaskCreatedBy("Pruthvi");
		task.setTaskType("issue");
		task.setDate(taskId);
		task.setStatus("Open");
		
		/*String taskId = "1510678989064";
		String userName = "chaitanya";
		String status = "Development"; */
		
		TaskServiceImpl impl = new TaskServiceImpl();
		impl.createTask(task);
		//impl.assignTask(taskId, userName);
		//impl.updateStatus(status, taskId);
		//List<Task> tasks = impl.getAllTasksOfUser(userName);
		/*List<Task> tasks = impl.getAllIssues();
		if(tasks != null && !tasks.isEmpty()) {
			System.out.println("tasks retrieved.");
		} else {
			System.out.println("Unable to retrieve tasks.");
		}*/
		
	}
}
