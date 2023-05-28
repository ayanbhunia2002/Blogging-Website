package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class Edit_Servlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =  response.getWriter();
		
		// fetch all data
		
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
//		Part part = request.getPart("image");
//		String imageName = part.getSubmittedFileName();
		
		// get the user from the session
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
//		user.setProfile(imageName);
		
		// update database
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userdao.updateUser(user);
		if(ans == true) {
			out.println("Updated to db");
		}
		else {
			out.println(" Not Updated");
		}
		
		
	}

}
