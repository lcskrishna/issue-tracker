package com.tracker.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tracker.api.TaskService;
import com.tracker.models.Task;

@Controller
@RequestMapping("/task")
public class TaskController {

	@Autowired
	TaskService taskService;
	
	@RequestMapping(value = "/add_task", method = RequestMethod.GET)
	public ModelAndView add_task() {
		return new ModelAndView("add_task", "command", new Task());
	}
	
	@RequestMapping(value = "/createTask", method = RequestMethod.POST)
	public ModelAndView createTask(@ModelAttribute("SpringWeb") Task task, ModelMap model) {
		task.setTaskId(String.valueOf(new Date().getTime()));
		task.setDate(task.getTaskId());
		String taskId = taskService.createTask(task);
		if(taskId != null && !taskId.isEmpty()) {
			model.addAttribute("user", task.getTaskCreatedBy());
			return new ModelAndView("manager", "command", new Task());
		}
		else {
			return new ModelAndView("failure_task", "command", new Task());
		}
	}
	
	@RequestMapping(value = "/assignTask", method = RequestMethod.POST)
	public ModelAndView assignTask(@ModelAttribute("SpringWeb") Task task, ModelMap model) {
		taskService.assignTask(task.getTaskId(), task.getTaskAssignedTo());
		model.addAttribute("user", task.getTaskCreatedBy());
		return new ModelAndView("manager", "command", new Task());
	}
	
	@RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
	public ModelAndView updateStatus(@ModelAttribute("SpringWeb") Task task, ModelMap model) {
		taskService.updateStatus(task.getStatus(), task.getTaskId());
		model.addAttribute("user", task.getTaskAssignedTo());
		return new ModelAndView("developer", "command", new Task());
	}
	
	@RequestMapping(value = "/issues", method = RequestMethod.POST)
	public ModelAndView getAllIssues(ModelMap model) {
		List<Task> issues = taskService.getAllIssues();
		model.addAttribute("issues", issues);
		return new ModelAndView("issues_home", "command", new Task());
	}
	
	@RequestMapping(value = "/viewTasks", method = RequestMethod.POST)
	public ModelAndView getAllTasks(ModelMap model) {
		List<Task> tasks = taskService.getAllTasks();
		model.addAttribute("tasks", tasks);
		return new ModelAndView("view_all_tasks", "command", new Task());
	}
	
	@RequestMapping(value = "/viewAssignedTasks/{userName}", method = RequestMethod.POST)
	public ModelAndView getAllAssignedTask(@PathVariable("userName") String userName, ModelMap model) {
		List<Task> tasks = taskService.getAllTasksOfUser(userName);
		model.addAttribute("tasks", tasks);
		return new ModelAndView("developer_tasks", "command", new Task());
		
	}
}
