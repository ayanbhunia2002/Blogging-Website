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

	<div class="container-fluid position-fixed menu1">
		<div class="row flex-nowrap">
			<div class="bg-white col-auto col-xl-2 p-0 min-vh-100 d-flex flex-column justify-content-between ">
				<div class="bg-white p-4 py-sm-4">
					<div
						class="d-flex text-decoration-none mt-1 align-items-center homepage1">
						<i class="fs-5 fa fa-house"></i> <span
							class="fs-3 ms-3 d-none d-sm-inline ">Home Page</span>
					</div>
					<ul class="nav nav-pills flex-column mt-3 sfsf">
						<li class="nav-item py-2 py-sm-1 border"><a
							href="profile.jsp" class="nav-link text-dark"> <i
								class="fs-5 fa fa-user"></i><span
								class="fs-5 ms-3 d-none d-sm-inline">Profile</span>
						</a></li>
						<li class="nav-item py-2 py-sm-1 border"><a href="see_post.jsp"
							class="nav-link text-dark"> <i
								class="fs-5 fas fa-sticky-note"></i><span
								class="fs-5 ms-3 d-none d-sm-inline">See All Post</span>
						</a></li>
						<li class="nav-item py-2 py-sm-1 border"><a href="#"
							class="nav-link text-dark"> <i class="fs-5 fas fa-pen-alt"></i><span
								class="fs-5 ms-3  d-none d-sm-inline">Create Post</span>
						</a></li>
						<li class="nav-item py-2 py-sm-1 border"><a href="#"
							class="nav-link text-dark"> <i class="fs-5 fa fa-user-times"></i><span
								class="fs-5 ms-3 d-none d-sm-inline">Log out</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>




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
					<li class="nav-item fs-5 ms-4"><a class="nav-link activer"
						href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal">
							<span class="fa fa-user-circle"></span> <%=user.getName()%>
					</a></li>
					<li class="nav-item fs-5 ms-4"><a class="nav-link active"
						href="LogoutServlet"><span class="fa fa-user-plus"></span> Log
							out </a></li>
				</ul>
			</div>
		</div>
	</nav>

	
	
	<div class="card shadow card1" style="background: #e0e0e0;">
		<div class="card-body">
			<h3 class="text-center shadow-0">What is going on in your mind?</h3>

			<form id="add-post-form" action="AddPostServlet" method="post">

				<div class="form-group">
					<label for="exampleFormControlSelect1">Category</label> <select
						class="form-control" id="exampleFormControlSelect1" name="cid">
						<option selected disabled="disabled">---Select
							Category---</option>

						<%
						PostDao postd = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list = postd.getAllCategories();
						for (Category c : list) {
						%>
						<option value="<%=c.getCid()%>"><%=c.getName()%></option>

						<%
						}
						%>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">Post Title</label> <input
						name="pTitle" type="text" class="form-control"
						id="exampleFormControlInput1" placeholder="Enter post title">
				</div>
				<div class="form-group border">
					<label for="exampleFormControlTextarea1">Post Content</label>
					<textarea name="pContent" class="form-control"
						id="exampleFormControlTextarea1" rows="12"
						placeholder="Enter your content"></textarea>
				</div>
				<div class="form-group border">
					<label for="exampleFormControlTextarea1">Enter Link</label>
					<textarea name="pCode" class="form-control"
						id="exampleFormControlTextarea1" rows="4"
						placeholder="Enter your program (if any)"></textarea>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">Select your pic</label> <br>
					<input name="pic" type="file" class="form-control"
						id="exampleFormControlInput1" placeholder="Enter your file/pic">
				</div>

				<br>
				<div class="container text-center">
					<button type="submit" class="btn btn-secondary shadow">
						Post</a>
				</div>
			</form>
		</div>
	</div>












	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="profile-modal">MakeBlog</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profile_pictures/<%=user.getProfile()%>"
							class="img-fluid" style="border-radius: 50%; max-width: 150px;">
						<br>

						<h5 class="modal-title mt-3" id="profile-modal"
							style="color: black;"><%=user.getName()%></h5>

						<!-- // details -->
						<table class="table">

							<tbody>
								<tr>
									<th scope="row" style="color: black;">ID :</th>

									<td style="color: black;"><%=user.getId()%></td>

								</tr>
								<tr>
									<th scope="row" style="color: black;">Email :</th>
									<td style="color: black;"><%=user.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row" style="color: black;">Gender :</th>
									<td colspan="2" style="color: black;"><%=user.getGender()%></td>

								</tr>
								<tr>
									<th scope="row" style="color: black;">Registered on :</th>
									<td colspan="2" style="color: black;"><%=user.getRdate()%></td>

								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">EDIT</button>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>





	<!--now add post js-->
    <script>
        $(document).ready(function (e) {
            //
            $("#add-post-form").on("submit", function (event) {
                //this code gets called when form is submitted
                event.preventDefault();
                console.log("you have clicked on submit..")
                let form = new FormData(this);

                //now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success ..
                        console.log(data);
                        if (data.trim() == 'done')
                        {
                            swal("Good job!", "saved successfully", "success");
                        } else
                        {
                            swal("Error!!", "Something went wrong! try again..", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error..
                        swal("Error!!", "Something went wrong! try again...", "error");
                    },
                    processData: false,
                    contentType: false
                })
            })
        })
    </script>




</body>
</html>