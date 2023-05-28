<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	
	if(session.getAttribute("currentUser") == null){
		response.sendRedirect("index.jsp");
	}
%>



<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="js/jjss.css">

<title>Insert title here</title>
</head>
	
	
<body>
<div class="row">

	<%
	/* Thread.sleep(100); */

	PostDao d = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));

	/* Category ct = d.getCategoryBycid(cid); */

	List<Post> posts = null;
	if (cid == 0) {
		posts = d.getAllPost();
	} else {
		posts = d.getPostByCatId(cid);
	}

	if (posts.size() == 0) {
		out.println("<h2 class = 'display-3 text-center'>No Post in this category </h2>");
		return;
	}
	for (Post p : posts) {
	%>

	<div class="col-md-6 mt-2 mb-1">
		<div class="card border border-1 shadow-sm p-3 mb-4 "
			style="border-radius: 10px; background: #fff; cursor:pointer;">

			<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top border border-1 rounded" alt="ggg">
			
			
			
			<%
				int ccid1 = p.getCatId();
				Category ct1 = d.getCategoryBycid(ccid1);
			%>
				
			<%
				UserDao ud1 = new UserDao(ConnectionProvider.getConnection());
			%>
				
			<div class="clearfix">
 				<a href="Post_user_profile.jsp?user_id=<%=p.getUserId()%>" class="float-start mt-2 " style="text-decoration: none; ;font-size: 16px; color: #6c757d; margin-left: 3px;"><i class="fa-regular fa-user" style="color: #008374; font-size: 15px; margin-right: 6px;"></i><%= ud1.getUserByUserId(p.getUserId()).getName() %></a>
 				<span class="float-end mt-2 " style="font-style: italic ;font-size: 14px; color: #6c757d; margin-left: 5px;"><i class="far fa-clock" style="color: #008374; font-size: 15px; margin-right: 6px;"></i> <%= p.getpDate() %></span>
			</div>
						
						
						
		    					
			
			
			<%
			int ccid = p.getCatId();
			Category ct = d.getCategoryBycid(ccid);
			%>
			<div class="clearfix">
    			<span class="float-start mt-3 text-white" style="padding: 5px 10px; background: rgb(0, 128, 128); border-radius: 20px; font-size: 13px;"><%=ct.getName()%></span>
  			</div>
			

			<div class="card-body" style="">
				<b> <%=p.getpTitle()%></b>
				<%-- <p class="card-text content1" >
					<%=p.getpContent()%>
				</p> --%>
				
				
				
				
				

			</div>

			<div class="card-footer container-fuid ">
				<div class="row justify-content-between">
					<div class="col-4">
						 <!-- URL rewriting -->
						<a href="show_blog_page.jsp?post_id=<%=p.getPid()%>"
							class="btn btn-sm text-white"
							style="background: rgb(0, 128, 128); border-radius: 5px">Read Blog ...</a>
					</div>
					<div class="col-6">
						
							<%
	    						LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
								User uuu = (User)session.getAttribute("currentUser");
	    					%>
			    				
			    			
	    					<a href="#!" onclick="doLike(<%= p.getPid() %>, <%= uuu.getId() %>)" class="btn btn"><i class="fa fa-thumbs-up"
									style="color: #10927c;"></i> <span class="like-counter"> <%= ld.countLikeOnPost(p.getPid()) %></span> </a>  
					
							<a href="#!"
							class="btn btn-sm"><i class="far fa-comment-dots"
							style="color: #10927c;"></i> <span> comments</span> </a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%
	}
	%>

</div>

<!-- Javascript  -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<!-- <script >
		$(document).ready(function(){
			alert("loaded")
		})
	</script> -->

<!-- <script>
	let charq = 15;
	let contects = document.querySelectorAll(".content1");
	console.log(contects);
	contects.forEach(content1 => {
		let displayText = content1.textContent.slice(0, charq);
		let moreText = content1.textContent.slice(charq);
		content1.innerHTML = '${displayText}<span class = "dots"> ... </span><span class = "hide more">${moreText}</span>';
	})
</script> -->

</body>


