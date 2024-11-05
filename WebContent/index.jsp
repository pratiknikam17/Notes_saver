<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- <%@ page import="com.db.DBConnect"%>
<%@ page import="java.sql.Connection"%> -->



<%@ page import="com.User.UserDetails"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E Notes</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
.back-img {
	background: url('img/book1.jpg') no-repeat center center fixed;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff; /* Default text color */
	text-align: center;
}

.navbar-custom {
	background-color: #343a40; /* Dark grey */
}

.navbar-custom .navbar-brand, .navbar-custom .nav-link {
	color: #ffdd57 !important; /* Yellow text for navbar */
}

.back-img h1 {
	color: #e01414; /* Green color for main heading */
}

.back-img p {
	color: #e01414;
}

.back-img .btn-light {
	color: #e01414; /* Dark text for buttons */
	background-color: #93cae6; /* Light button background */
}

.footer {
	background-color: #343a40; /* Dark grey */
	color: #ffb6c1; /* Light pink text for footer */
	padding: 10px;
	text-align: center;
}

.footer p {
	margin: 0;
}
/* General button style */
.btn-custom {
	background-color: #e8be25; /* Primary blue color */
	color: #fff; /* White text */
	padding: 10px 20px;
	border-radius: 5px; /* Rounded corners */
	border: none;
	font-weight: bold;
	transition: all 0.3s ease;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
}

/* Hover effect */
.btn-custom:hover {
	background-color: #e8be25; /* Darker blue */
	color: #f1f1f1;
	transform: translateY(-2px); /* Slight lift on hover */
	box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.15);
}

/* Active state */
.btn-custom:active {
	transform: translateY(1px); /* Pressed-down effect */
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}
</style>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>


	<nav
		class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
		<a class="navbar-brand" href="#"><i class="fa fa-book"
			aria-hidden="true"></i> <strong>ENOTES</strong></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
						class="fa fa-home" aria-hidden="true"></i> <strong>Home</strong> <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="addNotes.jsp"><i
						class="fa fa-plus-circle" aria-hidden="true"></i> <strong>Add
							Notes</strong></a></li>
				<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
						class="fa fa-address-book-o" aria-hidden="true"></i> <strong>Show
							Notes</strong></a></li>
			</ul>

			<!-- User session handling -->
			<%
			UserDetails user = (UserDetails) session.getAttribute("userD");
			if (user != null) {
			%>
			<a href="#" class="btn btn-light my-2 my-sm-0 mr-2"
				data-toggle="modal" data-target="#exampleModal" type="button"> <i
				class="fa fa-user-circle-o" aria-hidden="true"></i> <%=user.getName()%>
			</a> <a href="LogoutServlet" class="btn btn-light my-2 my-sm-0"
				type="button"> <i class="fa fa-sign-out" aria-hidden="true"></i>
				Logout
			</a>

			<!-- Modal for User Info -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">User
								Information</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="container text-center">
								<i class="fa fa-user fa-3x" aria-hidden="true"></i>
								<table class="table mt-3">
									<tbody>
										<tr>
											<th>User Id</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th>Full Name</th>
											<td><%=user.getName()%></td>
										</tr>
										<tr>
											<th>Email Id</th>
											<td><%=user.getEmail()%></td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-custom mr-2"><i
				class="fa fa-user-circle-o" aria-hidden="true"></i> <strong>Login</strong></a> <a
				href="register.jsp" class="btn btn-custom"><i
				class="fa fa-user-plus" aria-hidden="true"></i> <strong>Register</strong></a>

			<%
			}
			%>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text">
				<i class="fa fa-book" aria-hidden="true"></i> <strong> E
					Notes - Your Digital Notebook for Managing Notes </strong>
			</h1>
			<p>E Notes is an intuitive, web-based platform designed to help
				users save, organize, and access their notes seamlessly. Whether
				you're a student, professional, or anyone who likes to keep their
				notes structured, E Notes provides a simple and reliable way to
				manage all your important information in one place.</p>
			<p>E Notes simplifies the process of keeping digital notes,
				making it a valuable tool for anyone who wants a dedicated space for
				personal or academic information storage. Designed and developed by
				Pratik Nikam, E Notes is here to make note-taking and retrieval
				hassle-free.
		</div>
	</div>

	<!-- Footer -->
	<div class="footer">
		<strong><p>Any Errors occur then contact Pratik Nikam.
				Designed and developed by Pratik Nikam</p></strong> <strong><p>All
				Rights Reserved @PratikNikam-2024</p></strong>
	</div>

	<!-- Bootstrap JS and dependencies (jQuery and Popper.js) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
