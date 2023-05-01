<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
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
	<link rel="stylesheet" href="js/myjs.js">
	
	
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="oDKustpD"></script>
	
	
	<title><%= p.getpTitle()  %></title>
</head>
<body>

<div id="fb-root"></div>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="oDKustpD"></script>
	

	<!-- Navbar  -->
	
	<nav class="navbar fixed-top navbar-expand-md navbar-dark navbar1 py-0 shadow-sm">
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
    
    
    
    
    
    <div class="container-fluid" style="background: #fff;">
    	<div class="row my-1 ">
    		<div class="col-sm-7 mx-auto ">
    			<div class="card mt-5 border border-white">
					<div class="card-header bg-white">
						<h1 class="mt-4" style="font-size: 2.25rem; font-weight: 600; color: #3a3a3a; line-height: 3rem;"> <%= p.getpTitle() %></h1>
					</div> 
					
					<div class="card-body ">
					
						<img src="blog_pics/<%=p.getpPic()%>" class="card-img-top border border-1 shadow-sm" style="border-radius: 10px;" alt="ggg">
						<br>
						
						
						<%
							int ccid = p.getCatId();
							Category ct = d.getCategoryBycid(ccid);
						%>
						
						
						 <div style="margin-top: 20px; color: #6c757d;">
							<ul style="display: flex; align-items: center; list-style: none;">
								<li>
									<%
										UserDao ud = new UserDao(ConnectionProvider.getConnection());
									%>
								
				    				<p style="font-size: 18px; margin-right: 20px;">
				    					<i class="fa-regular fa-user" style="color: #008374; font-size: 15px; margin-right: 6px;"></i>
				    					<a href="#!" style="text-decoration: none;"> <%= ud.getUserByUserId(p.getUserId()).getName() %></a>
				    				</p>
								</li>
								<li style="display: flex; align-items: cneter; margin-right: 20px;">
									<p style="font-style: italic; font-family: 600;">
			    						<i class="far fa-clock" style="color: #008374; font-size: 16px; margin-right: 6px;"></i> <%= p.getpDate() %>
			    					</p>
								</li>
								<li style="display: flex; align-items: cneter;">
									<p>
										<a href="#!"><i class="far fa-comment-dots"
												style="color: #008374; font-size: 16px; margin-right: 6px;"></i></a>
										12 comments
									</p>
								</li>
								
							</ul>						
						</div> 
						
						<%-- <div class="clearfix">
						<span class="float-start" style="font-size: 15px;">
						
								<%
									UserDao ud = new UserDao(ConnectionProvider.getConnection());
								%>
								
			    				<p class="" style="font-size: 18px; margin-top: 10px; margin-left: 20px;"> <i class="far fa-user-circle" style="color: rgb(0, 128, 128); font-size: 15px;"></i>
			    					<a href="#!" style="text-decoration: none; color: #6c757d; margin-left: 7px;"> <%= ud.getUserByUserId(p.getUserId()).getName() %></a>
			    				</p>
			    			</span>
			    			
			    			
			    			<span class="float-end" >
			    				<p style="font-style: italic; font-family: 600; margin-top: 10px;">
			    					<i class="far fa-clock"></i>posted on - <%= p.getpDate() %>
			    				</p>
			    			</span>
			  			</div> --%>
						
						
						<%-- <ul style="display: flex; align-items: center; list-style: none;">
						<li style="font-size: 15px;">
						
								<%
									UserDao ud = new UserDao(ConnectionProvider.getConnection());
								%>
								
			    				<p class="" style="font-size: 18px; margin-top: 10px; margin-left: 20px;"> <i class="far fa-user-circle" style="color: rgb(0, 128, 128); font-size: 15px;"></i>
			    					<a href="#!" style="text-decoration: none; color: #6c757d; margin-left: 7px;"> <%= ud.getUserByUserId(p.getUserId()).getName() %></a>
			    				</p>
			    			</li>
			    			
			    			
			    			<li>
			    				<p style="font-style: italic; font-family: 600; margin-top: 10px;">
			    					<i class="far fa-clock"></i>posted on - <%= p.getpDate() %>
			    				</p>
			    			</li>
			  			</ul> --%>
			  			
			  			
			  			
			  			<div class="clearfix">
			    			<span class="float-start text-white " style="padding: 5px 25px; background: rgb(0, 128, 128); border-radius: 20px; font-size: 16px;"><%=ct.getName()%></span>
			    			
			  			</div>
			  			<br>
			  			
					
						<p class="lh-base " style="color: #3a3a3a!important; font-weight: 400; font-size: 20px!important; opacity: 0.9"><%= p.getpContent() %></p>
						
						<br><br>
						
						
						<div class="post-code">
							<pre> <%= p.getpCode() %></pre>
						</div>
						
					</div>
					
					
					
					
					
					
					<div class = "card-footer" style="background: #fff;">
						<div class="row justify-content-between">
							<div class="clearfix">
			    				<span class="float-end" >
			    				
			    					<%
			    						LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
			    					%>
			    				
			    				
			    					<a onclick="doLike(<%= p.getPid() %>, <%= user.getId() %>)" class="btn btn"><i class="fa fa-thumbs-up"
											style="color: #10927c;"></i> <span class="like-counter"> <%= ld.countLikeOnPost(p.getPid()) %></span> </a> 
									<a href="#!" class="btn btn"><i class="far fa-comment-dots"
											style="color: #10927c;"></i> <span> 20</span> </a>
			    			</span>
			  			</div>
						</div>
					</div>
					
					
					<div class = "card-footer">
						<div class="fb-comments" data-href="http://localhost:8291/makeBlog/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-width="" data-numposts="10"></div>
					</div>
					
								
    			</div>
    		</div>
    	</div>
    </div>
    
    


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
		
	<script src="js/myjs.js" type="text/javascript"></script>	
		
	<!-- <script >
		$(document).ready(function(){
			alert("loaded")
		})
	</script> -->
	
	
	
	
</body>
</html>