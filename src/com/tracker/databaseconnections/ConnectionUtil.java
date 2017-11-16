package com.tracker.databaseconnections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static com.tracker.constants.TrackerData.JDBC_DRIVER;
import static com.tracker.constants.TrackerData.DB_URL;
import static com.tracker.constants.TrackerData.PASSWORD;
import static com.tracker.constants.TrackerData.USERNAME;

public class ConnectionUtil {
	
	public static Connection connectToDb() throws ClassNotFoundException, SQLException {
		
		Connection connection;
		Class.forName(JDBC_DRIVER);
		System.out.println("INFO: Connecting to to database..");
		connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);	
		return connection;	
	}
}
