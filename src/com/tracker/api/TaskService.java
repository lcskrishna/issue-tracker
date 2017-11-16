package com.tracker.api;

import java.util.List;

import com.tracker.models.Task;

public interface TaskService {

	public String createTask(Task task);
	
	public boolean assignTask(String taskId, String userName);
	
	public boolean updateStatus(String status, String taskId);
	
	public List<Task> getAllTasks();
	
	public List<Task> getAllTasksOfUser(String userName);
	
	public List<Task> getAllIssues();
	
}
