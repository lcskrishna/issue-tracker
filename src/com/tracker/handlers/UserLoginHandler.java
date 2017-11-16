package com.tracker.handlers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tracker.databaseconnections.ConnectionUtil;
import com.tracker.models.UserLogin;

public class UserLoginHandler {

	// Get all the users.
	private Connection conn = null;
	private Statement stmt = null;

	public boolean addUser(UserLogin user) {
		boolean isAdded = false;
		try {
			conn = (Connection) ConnectionUtil.connectToDb();
			stmt = conn.createStatement();

			String sql = "INSERT INTO USER_TABLE(USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAILID, ROLE) VALUES ('"
					+ user.getUserName()
					+ "','"
					+ user.getPassword()
					+ "','"
					+ user.getFirstName()
					+ "','"
					+ user.getLastName()
					+ "','"
					+ user.getEmailId() 
					+ "','"
					+ user.getRole() + "');";

			System.out.println("DEBUG: Add user Sql statement: " + sql);
			stmt.executeUpdate(sql);
			isAdded = true;
			System.out.println("INFO: User has been added into the database : "
					+ user.toString());

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			if (e.getMessage() != null) {
				System.out
						.println("ERROR: Add user failed with following error: "
								+ e.getMessage());
			}
		} finally {
			closeStatement();
		}
		return isAdded;
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

	public String validateUserLogin(UserLogin userLogin) {

		String role = "";
		try {
			conn = (Connection) ConnectionUtil.connectToDb();
			stmt = conn.createStatement();

			String sql = "SELECT ROLE FROM USER_TABLE WHERE USERNAME ='"
					+ userLogin.getUserName() + "' AND PASSWORD='"
					+ userLogin.getPassword() + "';";

			System.out.println("DEBUG: SQL Query is : " + sql);
			ResultSet resultSet = stmt.executeQuery(sql);
			if (resultSet.next()) {
				role = resultSet.getString("ROLE");
				System.out.println("INFO: Validation successful and the role is : " + role);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeStatement();
		}
		return role;
	}

	public List<UserLogin> getAllUsers() {
		List<UserLogin> users = new ArrayList<UserLogin>();

		try {
			conn = (Connection) ConnectionUtil.connectToDb();
			stmt = conn.createStatement();
			String sql = "SELECT * FROM USER_TABLE;";
			System.out.println("DEBUG: SQl for get all users is : " + sql);
			ResultSet resultSet = (ResultSet) stmt.executeQuery(sql);
			while (resultSet.next()) {
				UserLogin user = setUserDetails(resultSet);
				users.add(user);
			}
			System.out.println("INFO: User count that have been retrieved: "
					+ users.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	private UserLogin setUserDetails(ResultSet resultSet) throws SQLException {
		UserLogin user = new UserLogin();
		user.setUserName(resultSet.getString("USERNAME"));
		user.setPassword(resultSet.getString("PASSWORD"));
		user.setFirstName(resultSet.getString("FIRSTNAME"));
		user.setLastName(resultSet.getString("LASTNAME"));
		user.setEmailId(resultSet.getString("EMAILID"));
		user.setRole(resultSet.getString("ROLE"));
		return user;
	}

}
