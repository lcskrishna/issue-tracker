package com.tracker.models;

public class Task {

	private String taskId;
	private String taskName;
	private String taskType;
	private String taskCreatedBy;
	private String taskAssignedTo;
	private String date;
	private String status;
	
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskType() {
		return taskType;
	}
	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}
	public String getTaskCreatedBy() {
		return taskCreatedBy;
	}
	public void setTaskCreatedBy(String taskCreatedBy) {
		this.taskCreatedBy = taskCreatedBy;
	}
	public String getTaskAssignedTo() {
		return taskAssignedTo;
	}
	public void setTaskAssignedTo(String taskAssignedTo) {
		this.taskAssignedTo = taskAssignedTo;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Task [taskId=" + taskId + ", taskName=" + taskName
				+ ", taskType=" + taskType + ", taskCreatedBy=" + taskCreatedBy
				+ ", taskAssignedTo=" + taskAssignedTo + ", date=" + date
				+ ", status=" + status + "]";
	}
	
}
