<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
		UserDetails user1=(UserDetails)session.getAttribute("userD");
		if(user1==null){
			response.sendRedirect("login.jsp");
			session.setAttribute("Login-error", "Please Login..");
		}
	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		

		<h1 class="text-center mt-5">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddnotesServlet" method="post">
						<div class="form-group">
							<%
							 UserDetails us=(UserDetails)session.getAttribute("userD");
							 if(us != null){
								 %>
								 		<input type="hidden" value="<%=us.getId()%>" name="uid">
								 <%
							 }
							%>
					
							 <label
								for="exampleInputEmail1"><b>Enter Title</b></label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><b>Enter Content</b></label>
							<textarea rows="10" cols="" class="form-control" name="content"
								required="required"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">
								<b>Add Notes</b>
							</button>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>