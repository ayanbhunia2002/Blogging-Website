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
	<div class="services" id = "ser">
	<div class="cen">
		<div class="service">
			<i class="fa fa-edit"></i>
			<h2> Easy Post</h2>
			<p> With just a click, share your <br>thoughts and experiences effortlessly. With user-friendly interfaces, posting content has become a seamless experience. </p>
		</div>
		<div class="service">
			<i class="	fa fa-line-chart"></i>
			<h2> Creativity</h2>
			<p> Creativity is the paintbrush, of the<br> mind, transforming blank canvases into vivid masterpieces of imagination. It is the alchemy <br>of the mind.</p>
		</div>
		<div class="service">
			<i class="fa fa-cogs"></i>
			<h2> Support </h2>
			<p> We support you 24/7 hours<br>Feel free to ask, ready to support you all time. Support is the foundation upon which we build resilience and reach new heights.</p>
		</div>

	</div>
	</div>

	<br><br>
	
	
	

	<!-- <div class="container">
		<div>
			<h1 class="article">Our Articles</h1>
		</div>
		<div class="row mb-42">

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
	</div> -->
	
	
	
	
	
	<br>
	
	
	<!-- ======= Contact Section ======= -->
    <section id="contact">
      <div class="container">

        <div class = "section-title" >
          <h1 >Contact</h1>
          <h4 style="color: #6c757d; text-align: center;">We are always ready to help you</h4>
          <br>
        </div>

      </div>

      <div class="container">
      	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d37829.33550548072!2d87.49989229679427!3d21.93947478709953!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a1d2c7b57556b0d%3A0x2dd6259913961b8d!2sJahalda%2C%20West%20Bengal%20721443!5e1!3m2!1sen!2sin!4v1682867917937!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </div>

      <div class="container">
        <div class="row mt-5">

          <div class="col-lg-6">

            <div class="row">
              <div class="col-md-12">
                <div class="info-box">
                	<i class="fa-solid fa-location-dot"></i>
                  <h3 style="color: black;">Our Address</h3>
                  <p>Jahalda, Paschim Medinipur, WB, 721443</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="info-box mt-4">
                  <i class="fa-solid fa-envelope"></i>
                  <h3 style="color: black;">Email Us</h3>
                  <p>bhuniaayan2002@gmail.com<br>ayanbhunia@gmail.com</p>
                </div>
              </div>
              <div class="col-md-6">
                <div class="info-box mt-4">
                  <i class="fa-solid fa-phone-volume"></i>
                  <h3 style="color: black;">Call Us</h3>
                  <p>+91 9883475331<br>+1 6678 254445 41</p>
                </div>
              </div>
            </div>

          </div>

          <div class="col-lg-6">
            <form id = "form12" action="" method="post" class="">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required="">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required="">
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required="">
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="7" placeholder="Message" required=""></textarea>
              </div>
              <div class="my-5">
                
              </div>
              <div class="text-center" >
              	<button id = "btn12" type="submit">Send Message</button>
              </div>
            </form>
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->
    
    <br><br>

 



















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