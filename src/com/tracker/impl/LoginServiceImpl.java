package com.tracker.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.tracker.api.LoginService;
import com.tracker.handlers.UserLoginHandler;
import com.tracker.models.UserLogin;

@Component
public class LoginServiceImpl implements LoginService {

	UserLoginHandler userHandler = new UserLoginHandler();
	
	@Override
	public boolean registerUser(UserLogin user) {
		return userHandler.addUser(user);
	}

	@Override
	public String validateUserLogin(UserLogin user) {
		return userHandler.validateUserLogin(user);
	}

	@Override
	public List<UserLogin> getAllUsers() {
		
		return userHandler.getAllUsers();
	}

}
