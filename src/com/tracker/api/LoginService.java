package com.tracker.api;

import java.util.List;

import com.tracker.models.UserLogin;

public interface LoginService {

	public boolean registerUser(UserLogin user);
	
	public String validateUserLogin(UserLogin user);
	
	public List<UserLogin> getAllUsers();
}
