<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

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
<link rel="stylesheet" href="css/style.css">
</head>


<body>

	<%-- <%
		Connection con = ConnectionProvider.getConnection();
	%>
	<h1> <%=con %></h1> --%>


	<%@include file="front.html"%>

	<br><br><br>

	<div class="container">
		<div class="row mb-42">

			<div class="col-md-3 offset-md-1">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-3">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-3">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
		</div>
		
		<br><br>
		
		<div class="row">

			<div class="col-md-4">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-4">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-4">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
		</div>
		
		<br><br>
		
		<div class="row">

			<div class="col-md-4">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-4">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-4">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text" style="color: black;">Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
						<a href="#" class="btn-navbar">Read More</a>
					</div>
				</div>

			</div>
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
</body>
</html>