<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="css/style2.css">


</head>


<body>


	<section class="Form my-5 mx-5">
		<div class="container mx-5">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<img alt="" src="images/sign_in_log_in/signin-image.jpg"
						class="mx-auto d-block img-fluid p-5">
				</div>

				<div class="col-lg-7 px-4 pt-3">

					<%
					Message m = (Message) session.getAttribute("msg");
					if (m != null) {
					%>

					<div class="alert <%=m.getCssClass()%>" role="alert">
						<%=m.getContent()%>
					</div>

					<%
					session.removeAttribute("msg");
					}
					%>


					<h1 class="font-weiht-bold">Login here</h1>
					<hr class="mb-5">
					

					<form id="reg-form" action="LoginServlet" method="post">
						<div class="form-row">
							<div class="col-lg-7 mb-4">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
						</div>

						<div class="form-row mb-4">
							<div class="col-lg-7">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="password" type="password" class="form-control "
									id="exampleInputPassword1" required="">
							</div>
						</div>

						<div class="form-row">
							<div class="col-lg-7">
								<button type="submit" class="btn1 mt-3 mb-5" href="#">Submit</button>
							</div>
						</div>

						<a href="forgot_Password.jsp">Forgot password</a>
						<p>
							Don't have an account? <a href="Registration_page.jsp">Register here</a>
						</p>

					</form>
				</div>
			</div>
		</div>
	</section>



	



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
</body>
</html>