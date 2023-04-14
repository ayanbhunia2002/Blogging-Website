package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() {

		try {
			if (con == null) {
				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://localhost:3306/practice";
				String username = "root";
				String pass = "Ayan@123";

				con = DriverManager.getConnection(url, username, pass);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}
