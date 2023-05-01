<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
	User user = (User)session.getAttribute("currentUser");
	if(user == null){
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
	
	<div class="container-fluid position-fixed menu1 ">
        <div class="row flex-nowrap">
            <div class="bg-white col-auto col-xl-2 p-0 min-vh-100 d-flex flex-column justify-content-between ">
                <div class="bg-white p-4 py-sm-4">
                    <div class="d-flex text-decoration-none mt-1 align-items-center homepage1">
                        <i class="fs-5 fa fa-house"></i> <span class="fs-3 ms-3 d-none d-sm-inline ">Home Page</span>
                    </div>
                    <ul class="nav nav-pills flex-column mt-3 border sfsf">
                        <li class="nav-item py-2 py-sm-1 border">
                            <a href="#" class="nav-link text-dark">
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
    
    
    <div class="card shadow card1" style="width: 55rem; height: 38rem; background: none; ">
    	<br>
	       
  		<div class="container text-center">
     	 	<img src="profile_pictures/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 150px;">
     	 	<br>
     	
     	 	<h4 class="modal-title mt-3" id="profile-modal" style="color: black;"><%= user.getName().toUpperCase() %></h4>
     	 	<br>
     	 	<!-- // details -->
     	 	<div id="profile-details">
     	 	<table class="table">
		
			  <tbody>
			    <tr>
			      <th scope="row" style="color: black;">User ID :</th>
			 
			      <td style="color: black;"><%= user.getId() %></td>
			     
			    </tr>
			    <tr>
			      <th scope="row" style="color: black;">Email Address :</th>
			      <td style="color: black;"><%= user.getEmail() %></td>

			    </tr>
			    <tr>
			      <th scope="row" style="color: black;">Gender :</th>
			      <td colspan="2" style="color: black;"><%= user.getGender() %></td>
			     
			    </tr>
			 	<tr>
			      <th scope="row" style="color: black;">Registered on :  </th>
			      <td colspan="2" style="color: black;"><%= user.getRdate() %></td>
			     
			    </tr>
			  </tbody>
			</table>
			</div>
			
			 <!--profile edit-->

             <div id="profile-edit" style="display: none;">
                 <h4 class="mt-2">Please Edit Carefully</h4>
                 <form action="Edit_Servlet" method="post" enctype="multipart/form-data">
                     <table class="table">
                         <%-- <tr>
                             <td>User ID :</td>
                             <td><%= user.getId()%></td>
                         </tr> --%>
                         <tr>
                             <td>Email Address :</td>
                             <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                         </tr>
                         <tr>
                             <td>Name :</td>
                             <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                         </tr>
                         <tr>
                             <td>Password :</td>
                             <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                         </tr>
                         <tr>
                             <td>Gender :</td>
                             <td> <%= user.getGender().toUpperCase()%> </td>
                         <!-- </tr>
                         <tr>
                             <td>New Profile :</td>
                             <td>
                                 <input type="file" name="image" class="form-control" >
                             </td>
                         </tr> -->

                     </table>

                     <div class="container">
                         <button type="submit" class="btn btn-outline-primary">Save</button>
                     </div><br>

                 </form>    

             </div>
			
	 	</div>
	 	<div class="d-flex justify-content-center align-items-center">
	        <button id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
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