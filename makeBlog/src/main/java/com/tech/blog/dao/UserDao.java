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
			//user -> database
			
			String query = "insert into user(name, email, password, gender, rdate) values(?, ?, ?, ?, ?)";

			PreparedStatement st = this.con.prepareStatement(query);
			st.setString(1, user.getName());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPassword());
			st.setString(4, user.getGender());
			st.setString(5, user.getRdate());

			st.executeUpdate();
			f = true;
//			st.close();
		} 
		catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}
	
	
	// get user by useremail and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		
		try {

			String query = "select * from user where email = ? and password = ?";

			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, email);
			st.setString(2, password);

			ResultSet res = st.executeQuery();

			if(res.next()) {
				user = new User();
				
				// data from database
				String name = res.getString("name");
				user.setName(name);
				
				user.setId(res.getInt("id"));
				user.setEmail(res.getString("email"));
				user.setPassword(res.getString("password"));
				user.setGender(res.getString("gender"));
				user.setRdate(res.getString("rdate"));
				user.setProfile(res.getString("profile"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(user);
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f = false;
		try {
			
			String query = "update user set name = ? , email = ?, password = ? where id = ?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
//			p.setString(4, user.getProfile());
			p.setInt(4, user.getId());
			
			p.executeUpdate();
			f = true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
