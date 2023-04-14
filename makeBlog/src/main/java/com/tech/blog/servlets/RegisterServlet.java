package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
			
			// create User object and set all data to that object
			User user = new User(name, user_email, user_password, gender);
			
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
