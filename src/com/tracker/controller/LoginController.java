package com.tracker.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tracker.api.LoginService;
import com.tracker.models.Task;
import com.tracker.models.UserLogin;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	LoginService loginService;

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("home", "command", new UserLogin());
	}

	@RequestMapping(value = "/validateUser", method = RequestMethod.POST)
	public ModelAndView validateUser(@ModelAttribute("SpringWeb") UserLogin userLogin, ModelMap model) {
		String role = loginService.validateUserLogin(userLogin);
		if (role.equalsIgnoreCase("Manager")) {
			System.out.println("INFO: Manager has been logged in.");
			model.addAttribute("user", userLogin.getUserName());
			return new ModelAndView("manager", "command", new UserLogin());
		} else if (role.equalsIgnoreCase("Developer")
				|| role.equalsIgnoreCase("QA")) {
			System.out.println("INFO: Developer/QA view will be displayed.");
			model.addAttribute("user", userLogin.getUserName());
			return new ModelAndView("developer", "command", new Task());
		} else {
			System.out.println("ERROR: Please enter a valid user.");
			return null;
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView userLogout() {
		return new ModelAndView("home", "command", new UserLogin());
	}
	
	@RequestMapping(value = "/showStaff", method = RequestMethod.GET)
	public ModelAndView getAllStaffMembers(ModelMap map) {
		List<UserLogin> staff = loginService.getAllUsers();
		map.addAttribute("staff", staff);
		return new ModelAndView("manager_staff", "command", new Task());
	}
}
