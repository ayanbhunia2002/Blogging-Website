package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;


public class LikeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String operation = request.getParameter("operation");
			int uid = Integer.parseInt(request.getParameter("uid"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			
			PrintWriter out = response.getWriter();
			
	//		out.println("data from server");
	//		out.println(operation + ", " + uid + ", " + pid );
			
			LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
			
			if (operation.equals("like")) {
				//String ff = "ab";
				if(ldao.isLikedByUser(pid, uid) == false)
				 {
					boolean f=ldao.insertLike(pid, uid);
	                out.println(f);
	               // ff = "bc";
				 }
				else {
					ldao.deleteLike(pid, uid);
				}
//				HttpSession hs =request.getSession();
//				hs.setAttribute("ff", ff);
//				out.println(ff);
			}
			
			
		
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

}
