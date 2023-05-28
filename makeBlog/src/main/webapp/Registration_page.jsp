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

<style>
.banner-background {
	clip-path: polygon(0 1%, 100% 1%, 100% 93%, 75% 100%, 27% 92%, 0 100%);
}
</style>

</head>
<body>

	<section class="Form my-5 mx-5">
		<div class="container mx-5">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<img alt="" src="images/sign_in_log_in/signup-image.jpg"
						class="mx-auto d-block img-fluid p-5">
				</div>

				<div class="col-lg-7 px-4">

					


					<h1 class="font-weight-bold  hh">Register here</h1><hr>

					<form id="reg-form" action="RegisterServlet" method="post">
					
						<div class="form-row mb-3">
							<div class="col-lg-7">
								<label for="user_name" class="form-label"><b>Username</b></label>
								<input name="user_name" type="text" class="form-control"
									id="user_name" placeholder="Enter user name" required="">
							</div>
						</div>
												
						<div class="form-row">
							<div class="col-lg-7 mb-3">
								<label for="exampleInputEmail1" class="form-label"><b>Email
									address</b></label>
								<input name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
						</div>
						

						<div class="form-row mb-4">
							<div class="col-lg-7">
								<label for="exampleInputPassword1" class="form-label"><b>Password</b></label>
								<input name="user_password" type="password" class="form-control "
									id="exampleInputPassword1" required="">
							</div>
						</div>
						
						<div class="form-row mb-3">
							<div class="col-lg-7">
								<label for="gender" class="form-label"><b class="me-3">Gender : </b></label>
								<input type="radio" id="gender" name="gender" value="male"> Male
								<input class="ms-3" type="radio" id="gender" name="gender" value="female"> Female
							</div>
						</div>
						
						<div class="form-row form-check">
							<div class="col-lg-7 mb-3">
								<label for="exampleCheck1" class="form-check-label">agree terms and condition</label> 
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1" required="">
								
							</div>
						</div>
						
						<!-- 
							<div class="container text-center" id="loader" style="display: none;">
								<span class="fa fa-refresh fa-spin "></span>
								<h4>Please wait..</h4>
							</div> -->

						<div class="form-row">
							<div class="col-lg-7">
								<button id="submit-btn" type="submit" class="btn1 mt-3 mb-4">Submit</button>
							</div>
						</div>

						<p>
							Already have an account? <a href="login_page.jsp">Log in</a>
						</p>

					</form>
				</div>
			</div>
		</div>
	</section>
	


	<!-- <main class="d-flex align-items-center banner-background"
		style="background-color: #0288D1; padding-bottom: 90px; padding-top: 50px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">

				<div class="card">
					<div class="card-header  text-center text-white"
						style="background-color: #0288D1">
						<span class="fa fa-user-plus fa-2x"></span> <br>
						<p>Registration here</p>
					</div>
					<div class="card-body">

						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="mb-3">
								<label for="user_name" class="form-label">User Name</label>
								<input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter user name">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> 
									<input name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" >
							</div>
							
							<div class="mb-3">
								<label for="gender" class="form-label">Select your Gender</label><br>
								<input type="radio" id="gender" name="gender" value="male">Male
								<input type="radio" id="gender" name="gender" value="female">Female
							</div>
							<div class="mb-3 form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and condition</label>
							</div>
							<br>
							<div class="container text-center" id="loader" style="display: none;">
								<span class="fa fa-refresh fa-spin fa-x"></span>
								<h4>Please wait..</h4>
							</div>
							
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
					<div class="card-footer">
					
					</div>

				</div>

			</div>

		</div>
	</main> -->



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
		
		
	
	<script>
            $(document).ready(function () {
                console.log("loaded........")

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);

                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#sumbimt-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done')
                            {

                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp"
                                        });
                            } else
                            {

                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                        	console.log(jqXHR)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });



        </script>
	
</body>
</html>