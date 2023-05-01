package com.tech.blog.entities;

import java.sql.*;

public class User {

	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String rdate;
	private String profile;

	public User(int id, String name, String email, String password, String gender, Timestamp rdate) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
//		this.rdate = rdate;
	}

	public User() {
	}

	public User(String name, String email, String password, String gender, String rdate) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.rdate = rdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
}
