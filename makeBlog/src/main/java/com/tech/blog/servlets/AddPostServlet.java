package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.Random;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

// to access the multi path data like - audio, image, text
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pic");
		Timestamp pDate = new Timestamp(System.currentTimeMillis());
		
		
		// getting current user id
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		//	user.getId();
		
		Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), pDate.toString(), cid, user.getId());
		
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		
		if(dao.savePost(p)) {
			
			String imageName = part.getSubmittedFileName();
			String path = "D:/Blogging Wesite/makeBlog/src/main/webapp/blog_pics/" + imageName;
			// System.out.println("path : " + path);
			
			Helper.saveFile(part.getInputStream(), path);
			
			out.println("Done");
		}
		else {
			out.println("Error");
		}
	}

}
