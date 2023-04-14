package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;
public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	// inserting user  to database
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			//user -> datavase
			
			String query = "insert into user(name, email, password, gender) values(?, ?, ?, ?)";

			PreparedStatement st = this.con.prepareStatement(query);
			st.setString(1, user.getName());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPassword());
			st.setString(4, user.getGender());

			st.executeUpdate();
			f = true;
//			st.close();
		} 
		catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}
	
}
