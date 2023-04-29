<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
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






	<nav class="navbar fixed-top navbar-expand-md navbar-dark navbar1 py-0">
		<div class="container-fluid gx-5">
			<a class="navbar-brand fs-2 ms-5" href="#">Make<span>B</span>log
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item  fs-5 ms-4"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item fs-5 ms-4"><a class="nav-link active"
						href="#">Link</a></li>
					<li class="nav-item active dropdown fs-5 ms-4"><a
						class="nav-link active dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item fs-5 ms-4"><a class="nav-link active"
						href="profile.jsp"> <span class="fa fa-user-circle"></span> <%=user.getName()%>
					</a></li>
					<li class="nav-item fs-5 ms-4"><a class="nav-link active"
						href="LogoutServlet"><span class="fa fa-user-plus"></span> Log
							out </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>




	<main style="background: #f0f0f0">
		<div class="container-fluid  ">
			<div class="row mt-2">
				<!--first col-->
				<div class="col-md-2 py-sm-3 min-vh-100" style="background: #fff;">
					<!--categories-->
					<div class="list-group">
						<a href="#" onclick="getPosts(0, this)"
							class=" c-link list-group-item list-group-item-action active">
							All Posts 
						</a>
						<!--categories-->

						<%
							PostDao d = new PostDao(ConnectionProvider.getConnection());
							ArrayList<Category> list1 = d.getAllCategories();
							for (Category cc : list1) {
						%>
						<a href="#" onclick="getPosts(<%= cc.getCid() %>, this)" class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>


						<%
						}
						%>
					</div>

				</div>

				<!--second col-->
				<div class="col-md-8 py-sm-3 " style="background: #f0f0f0;">
					<!--posts-->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-3x fa-spin"></i>
						<h3 class="mt-2">loading....</h3>
					</div>

					<div class="container-fluid" id="post-container"></div>
				</div>

			</div>

		</div>

	</main>


	<!--  <div class="card card1" style="background: #fafafa;">
		<div class="card-body">
			Post 
			
			<div class="container text-center" id = "loader">
				<i class="fa fa-refresh fa-2x fa-spin"></i>
				<p> boujqre </p>
			</div>
			
			
		</div>
	</div> -->


























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


	<!-- loading post using ajax -->
	<script>
		function getPosts(catId, temp) {
			$("#loader").show();
			$("#post-container").hide()

			$(".c-link").removeClass('active')

			$.ajax({
				url : "load_posts.jsp",
				data : {
					cid : catId
				},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$('#post-container').html(data)
					$(temp).addClass('active')

				}
			})

		}

		$(document).ready(function(e) {

			let allPostRef = $('.c-link')[0]
			getPosts(0, allPostRef)

		})
	</script>








</body>
</html>