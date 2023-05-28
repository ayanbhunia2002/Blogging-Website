package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		String check = request.getParameter("check");
		
		PrintWriter out = response.getWriter();
		if(check == null) {
			out.println("Box not checked");
		}
		else {
			String name = request.getParameter("user_name");
			String user_email = request.getParameter("user_email");
			String user_password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			Timestamp rdate = new Timestamp(System.currentTimeMillis());;
			
			// create User object and set all data to that object
			User user = new User(name, user_email, user_password, gender, rdate.toString());
			
			//Create UserDao object
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
				// save.....
				out.println("done");
			}
			else {
				out.println("error");
			}
		}
		
		
	}

}
