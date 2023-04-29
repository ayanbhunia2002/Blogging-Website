<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
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
	int postId = Integer.parseInt(request.getParameter("post_id"));
	
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	
	Post p = d.getPostByPostId(postId);

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
	
	<title><%= p.getpTitle()  %></title>
</head>
<body>

	<!-- Navbar  -->
	
	<nav class="navbar fixed-top navbar-expand-md navbar-dark navbar1 py-0">
        <div class="container-fluid gx-5">
            <a class="navbar-brand fs-2 ms-5" href="#">Make<span>B</span>log</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item  fs-5 ms-4">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                     <li class="nav-item fs-5 ms-4">
                        <a class="nav-link active" href="#">Link</a>
                    </li>
                    <li class="nav-item active dropdown fs-5 ms-4">
                        <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item fs-5 ms-4">
						<a class="nav-link active" href="#" > <span class="fa fa-user-circle"></span> 
							<%= user.getName() %>
						</a>
					</li>
					<li class="nav-item fs-5 ms-4">
						<a class="nav-link active" href="LogoutServlet"><span class="fa fa-user-plus"></span>
							Log out
						</a>
					</li>
                </ul>   
            </div>
        </div>
    </nav>
    
    
    
    
    
    <div class="container">
    	<div class="row my-4">
    		<div class="col-md-9 offset-md-2">
    			<div class="card mt-4">
					<div class="card-header">
						<h4> <%= p.getpTitle() %></h4>
					</div> 
					
					<div class="card-body">
					
						<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top border border-1 rounded" alt="ggg">
						
						<%
							int ccid = p.getCatId();
							Category ct = d.getCategoryBycid(ccid);
						%>
						<div class="clearfix">
			    			<span class="float-start mt-3 text-white" style="padding: 5px 10px; background: #10927c; border-radius: 20px; font-size: 13px;"><%=ct.getName()%></span>
			  			</div>
					
						<p><%= p.getpContent() %></p>
						
						<br><br>
						
						<pre> <%= p.getpCode() %></pre>
					</div>
					
					<div class = "card-footer">
						<div class="row justify-content-between">
							<div class="col-4">
						 		<!-- URL rewriting -->
								<a href="show_blog_page.jsp?post_id=<%=p.getPid()%>"
										class="btn btn-sm text-white"
										style="background: #10927c; border-radius: 5px">Read More...</a>
							</div>
							<div class="col-4">
								<a href="#!" class="btn btn-sm"><i class="fa fa-thumbs-up"
											style="color: #10927c;"></i> <span> 10</span> </a> 
								<a href="#!" class="btn btn-sm"><i class="far fa-comment-dots"
											style="color: #10927c;"></i> <span> 20</span> </a>
							</div>
						</div>
					</div>			
    			</div>
    		</div>
    	</div>
    </div>
    
    


	sthhhhhhhhhhh
	<h2> Post id : <%= postId %></h2>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
</body>
</html>