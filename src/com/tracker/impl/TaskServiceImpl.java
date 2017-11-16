package com.tracker.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.tracker.api.TaskService;
import com.tracker.handlers.TaskServiceHandler;
import com.tracker.models.Task;

@Component
public class TaskServiceImpl implements TaskService{

	TaskServiceHandler handler = new TaskServiceHandler();
	
	@Override
	public String createTask(Task task) {
		String taskId = handler.createTask(task);
		return taskId;
	}

	@Override
	public boolean assignTask(String taskId, String userName) {
		return handler.assignTaskToUser(taskId, userName);
	}

	@Override
	public boolean updateStatus(String status, String taskId) {
		return handler.updateStatusOfTask(status, taskId);
	}

	@Override
	public List<Task> getAllTasks() {
		List<Task> tasks = handler.getAllTasks();
		return tasks;
	}

	@Override
	public List<Task> getAllTasksOfUser(String userName) {
		List<Task> tasks = handler.getAllTasksAssignedToUser(userName);
		return tasks;
	}

	@Override
	public List<Task> getAllIssues() {
		List<Task> issuesPresent = handler.getAllIssues();
		return issuesPresent;
	}

}
