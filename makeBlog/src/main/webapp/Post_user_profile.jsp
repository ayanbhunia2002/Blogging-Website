<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	
	if(session.getAttribute("currentUser") == null){
		response.sendRedirect("index.jsp");
	}
%>


<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
	User user = (User)session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("login_page.jsp");
	}
%>


<%
	int userId = Integer.parseInt(request.getParameter("user_id"));
	UserDao udao = new UserDao(ConnectionProvider.getConnection());
	User poster = udao.getUserByUserId(userId);
%>



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
<link rel="stylesheet" href="css/ss.css">

<title>Insert title here</title>
</head>



<body>
	
	<div class="container-fluid position-fixed menu1 ">
        <div class="row flex-nowrap">
            <div class="bg-white col-auto col-xl-2 p-0 min-vh-100 d-flex flex-column justify-content-between ">
                <div class="bg-white p-4 py-sm-4">
                    <div class="d-flex text-decoration-none mt-1 align-items-center homepage1">
                        <i class="fs-5 fa fa-house"></i> <span class="fs-3 ms-3 d-none d-sm-inline ">Home Page</span>
                    </div>
                    <ul class="nav nav-pills flex-column mt-3 border-white sfsf">
                        <li class="nav-item py-2 py-sm-1 border">
                            <a href="profile.jsp" class="nav-link text-dark">
                                <i class="fs-5 fa fa-user"></i><span class="fs-5 ms-3 d-none d-sm-inline">Profile</span>
                             </a>
                        </li>
                        <li class="nav-item py-2 py-sm-1 border">
                            <a href="see_post.jsp" class="nav-link text-dark">
                                <i class="fs-5 fas fa-sticky-note"></i><span class="fs-5 ms-3 d-none d-sm-inline">See All Post</span> </a>
                        </li>
                        <li class="nav-item py-2 py-sm-1 border">
                            <a href="create_post.jsp" class="nav-link text-dark">
                                <i class="fs-5 fas fa-pen-alt"></i><span class="fs-5 ms-3  d-none d-sm-inline">Create Post</span> </a>
                        </li>
                        <li class="nav-item py-2 py-sm-1 border">
                            <a href="LogoutServlet" class="nav-link text-dark">
                                <i class="fs-5 fa fa-user-times"></i><span class="fs-5 ms-3 d-none d-sm-inline">Log out</span> </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>




    <nav class="navbar fixed-top navbar-expand-md navbar-dark navbar1 py-0">
        <div class="container-fluid gx-5">
            <a class="navbar-brand fs-2 ms-5" href="#">Make<span>B</span>log</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item  fs-5 ms-4">
                        <a class="nav-link active" aria-current="page" href="Home_Page.jsp">Home</a>
                    </li>
                     <li class="nav-item fs-5 ms-4">
                        <a class="nav-link active" href="create_post.jsp">Create Post</a>
                    </li>
                    <li class="nav-item fs-5 ms-4">
                        <a class="nav-link active" href="#">Contact</a>
                    </li>
                    <li class="nav-item fs-5 ms-4">
						<a class="nav-link active" href="profile.jsp" > <span class="fa fa-user-circle"></span> 
							<%= user.getName() %>
						</a>
					</li>
					<li class="nav-item fs-5 ms-4">
						<a class="nav-link active" href="LogoutServlet">
							Log out
						</a>
					</li>
                </ul>   
            </div>
        </div>
    </nav>
    
    
    <div class="card shadow card1" style="width: 55rem; height: 25rem; background: none; ">
    	<br>
	       
  		<div class="container text-center">
     	 	<img src="profile_pictures/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 150px;">
     	 	<br>
     	
     	 	<h4 class="modal-title mt-3" id="profile-modal" style="color: black;"><%= poster.getName().toUpperCase() %></h4>
     	 	<br>
     	 	<!-- // details -->
     	 	<div id="profile-details">
     	 	<table class="table">
		
			  <tbody>
			    <tr>
			      <th scope="row" style="color: black;">Email Address :</th>
			 
			      <td style="color: black;"><%= poster.getEmail() %></td>
			     
			    </tr>
			    <tr>
			      <th scope="row" style="color: black;">Gender :</th>
			      <td style="color: black;"><%= poster.getGender() %></td>

			    </tr>
			    <tr>
			      <th scope="row" style="color: black;">Registered on :</th>
			      <td colspan="2" style="color: black;"><%= poster.getRdate() %></td>
			     
			    </tr>
			 	
			  </tbody>
			</table>
			</div>
			
			 
			
	 	</div>
	</div>
	
	
	
	
	
	
	<br><br>
	<div class = "section-title1" >
	   <h1 >See <%= poster.getName() %>'s Post</h1>
    </div>
	
	<div class="container">
	<div class="row offset-md-2">

		<%
			PostDao d = new PostDao(ConnectionProvider.getConnection());
			
			List<Post> posts = null;
			
			posts = d.getPostByuId(poster.getId());

			if (posts.size() == 0) {
				out.println("<h2 class = 'display-3 text-center'> He/She has not posted anything </h2>");
				return;
			}
			for (Post p : posts) {
		%>

			<div class="col-md-6 mt-2 mb-1">
				<div class="card border border-1 shadow-sm p-3 mb-4 "
					style="border-radius: 10px; background: #fff; cursor:pointer;">
		
					<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top border border-1 rounded" alt="ggg">
					
					<%-- <%
						int ccid1 = p.getCatId();
						Category ct1 = d.getCategoryBycid(ccid1);
					%>
						
					<%
						UserDao ud1 = new UserDao(ConnectionProvider.getConnection());
					%> --%>
						
					<div class="clearfix">
		 				<span class="float-start mt-2 " style="font-size: 16px; color: #6c757d; margin-left: 3px;"><i class="fa-regular fa-user" style="color: #008374; font-size: 15px; margin-right: 6px;"></i><%= poster.getName() %></span>
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
	    					%>
			    				
			    			
	    					<a href="" class="btn btn"><i class="fa fa-thumbs-up"
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
	
	
	<script>
    	$(document).ready(function () {
        	let editStatus = false;

			$('#edit-profile-button').click(function ()
            {
				if (editStatus == false)
                    {
                        $("#profile-details").hide()

                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back")
                    }
					else
                    {
                        $("#profile-details").show()

                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit")

                    }

                })
            });

        </script>
	
	
	
	
	
</body>
</html>